public with sharing class EmployeeSkillsService {

    public static void OnAfterInsertUpdate(List<EmployeeSkills__c> skills){
        
        for(EmployeeSkills__c item: skills){
            List<AggregateResult> res = [
                SELECT Employee__r.Id emId, SUM(Assigned_Time__c) assignedTime  
                FROM EmployeeSkills__c 
                WHERE Employee__r.Id =: item.Employee__c AND Id !=: item.Id
                GROUP BY Employee__r.Id
                LIMIT 1
            ];
            
            List<Employee__c> em = [SELECT Availability__c FROM Employee__c  WHERE Id =: item.Employee__c];
            
            if(
                (!res.isEmpty() && em[0].Availability__c < (Double)res[0].get('assignedTime')+item.Assigned_Time__c) ||
                (res.isEmpty() &&   em[0].Availability__c < item.Assigned_Time__c)
            ){
                item.addError('The number of hours(Assigned Times) exceeds hours(availability) of employee.');
            }
            
        }
    }
}