public with sharing class EmployeeTriggerHelper {

    /* //first variant
    public static void OnBeforeInsertUpdate(List<Employee__c> employees){
         for (Employee__c insertItem : employees) {
                  List<Employee__c>  res = [
                      SELECT Id 
                      FROM Employee__c 
                      WHERE First_Name__c =: insertItem.First_Name__c AND
                      		Last_Name__c =: insertItem.Last_Name__c AND 
                      		Birthday__c =: insertItem.Birthday__c LIMIT 1];
             if(res.size() != 0){
                 insertItem.addError('Cannot insert employee');
             }
         }
    }*/
    
     public static void OnBeforeInsertUpdate(List<Employee__c> employees){
         List<String> firstNames = new List<String>();
         List<String> lastNames = new List<String>();
         List<Date> birthdays = new List<Date>();
         
         for (Employee__c insertItem : employees) {
             firstNames.add(insertItem.First_Name__c);
             lastNames.add(insertItem.Last_Name__c);
             birthdays.add(insertItem.Birthday__c);
         }
         
         List<Employee__c>  resDublicat = [
                      SELECT First_Name__c, Last_Name__c, Birthday__c
                      FROM Employee__c 
                      WHERE First_Name__c IN :firstNames AND
                      		Last_Name__c IN :lastNames AND 
                      		Birthday__c IN :birthdays  
         					];
         
         for (Employee__c insertItem : employees) {
             for(Employee__c errorItem : resDublicat){
                 if(
                     insertItem.First_Name__c == errorItem.First_Name__c && 
                     insertItem.Last_Name__c == errorItem.Last_Name__c && 
                     insertItem.Birthday__c == errorItem.Birthday__c &&
                     insertItem.Id != errorItem.Id
                 ){
                     insertItem.addError('adding a record is not possible. An employee with such data already exists');
                     break;
                 }
             }
         }

     }
}