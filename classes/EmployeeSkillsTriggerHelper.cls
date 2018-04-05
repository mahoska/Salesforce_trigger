public with sharing class EmployeeSkillsTriggerHelper {
    
	public static void OnAfterInsert(List<EmployeeSkills__c> skills){
        EmployeeSkillsService.OnAfterInsertUpdate(skills);
    }
    
    public static void OnAfterUpdate(List<EmployeeSkills__c> skills){
        EmployeeSkillsService.OnAfterInsertUpdate(skills);
    }
    
}