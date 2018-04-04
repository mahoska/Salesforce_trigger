@isTest
private  class EmployeeTriggerTest {
	
    @isTest 
    static void TestOnBeforeInsertUpdate() {
        // Test data setup
        // Create an employee, and then try to insert it
        Employee__c employee1 = new Employee__c(
            First_Name__c = 'Name', 
            Last_Name__c='Surname', 
            Birthday__c=system.today(), 
            IT_Department__c='DEV', 
            Level__c='Middle', 	
            Start_Date__c=system.today()
        );
        
        insert employee1;
        
        Test.startTest();
        Employee__c employee2 = new Employee__c(
            First_Name__c = 'Name', 
            Last_Name__c='Surname', 
            Birthday__c=system.today(), 
            IT_Department__c='DEV', 
            Level__c='Junior', 	
            Start_Date__c=system.today()
        );
        
        Database.SaveResult result = Database.insert(employee2, false);
        Test.stopTest();
        
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('adding a record is not possible. An employee with such data already exists',
                            result.getErrors()[0].getMessage());

    }
	
	
	/*//first variant
	@isTest 
    static void TestOnBeforeInsertUpdate() {
        // Test data setup
        // Create an employee, and then try to insert it
       Employee__c employee = new Employee__c(
            First_Name__c = 'Name', 
            Last_Name__c='Surname', 
			Birthday__c=system.today(), 
            IT_Department__c='DEV', 
            Level__c='Middle', 	
            Start_Date__c=system.today()
			);
      Test.startTest();
       insert employee;
      Test.stopTest();
        
      Employee__c employeeDB = [Select First_Name__c  from Employee__c where Id =: employee.Id];
      
      system.assertEquals(employeeDB.First_Name__c,'Name');
    }*/
    

    
}