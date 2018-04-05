public with sharing class EmployeeTriggerHelper {
    
    public static void OnAfterInsert(List<Employee__c> employees){
        EmployeeTriggerService.OnAfterInsertUpdate(employees);
    }
    
    public static void OnAfterUpdate(List<Employee__c> employees){
        EmployeeTriggerService.OnAfterInsertUpdate(employees);
    }
}