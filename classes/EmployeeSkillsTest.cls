@isTest
private class EmployeeSkillsTest {
	@isTest 
    static void TestOnAfterInsertUpdate() {
        Employee__c employee = new Employee__c(
            First_Name__c = 'Name', 
            Last_Name__c='Surname', 
            Birthday__c=system.today(), 
            IT_Department__c='DEV', 
            Level__c='Middle', 	
            Start_Date__c=system.today(),
            Availability__c = 8
        );
        insert employee;
        
        Project__c project1 = new Project__c(
            Name = 'Test',
            Start_Date__c=system.today()
        );
        insert project1;
        
        EmployeeSkills__c emplSk1 = new EmployeeSkills__c(
            Assigned_Time__c = 7, 
            Employee__c = employee.Id, 
  			Project__c = project1.Id
        );
        
        Test.startTest();
        	Database.SaveResult result = Database.insert(emplSk1, false);
        Test.stopTest();
        
            System.assert(result.isSuccess());
            System.assert(result.getErrors().size() < 0);
            System.assertNotEquals('The number of hours(Assigned Times) exceeds hours(availability) of employee.',
                                result.getErrors()[0].getMessage());
    }
    
    
    @isTest 
    static void TestOnAfterInsertUpdateList() {
        Employee__c employee = new Employee__c(
            First_Name__c = 'Name', 
            Last_Name__c='Surname', 
            Birthday__c=system.today(), 
            IT_Department__c='DEV', 
            Level__c='Middle', 	
            Start_Date__c=system.today(),
            Availability__c = 8
        );
        insert employee;
        
        Project__c project1 = new Project__c(
            Name = 'Test',
            Start_Date__c=system.today()
        );
        insert project1;
        
        EmployeeSkills__c emplSk1 = new EmployeeSkills__c(
            Assigned_Time__c = 7, 
            Employee__c = employee.Id, 
  			Project__c = project1.Id
        );
        
        EmployeeSkills__c emplSk2 = new EmployeeSkills__c(
            Assigned_Time__c = 2, 
            Employee__c = employee.Id, 
  			Project__c = project1.Id
        );
        
        List<EmployeeSkills__c>listEmplSk = new List<EmployeeSkills__c>{emplSk1, emplSk2};

        Test.startTest();
        	List<Database.SaveResult> result = Database.insert(listEmplSk, false);
        Test.stopTest();
        
        for(Database.SaveResult itemRes : result){
            System.assert(!itemRes.isSuccess());
            System.assert(itemRes.getErrors().size() > 0);
            System.assertEquals('The number of hours(Assigned Times) exceeds hours(availability) of employee.',
                                itemRes.getErrors()[0].getMessage());
        }
    }
	
	 @isTest 
    static void TestOnAfterInsertUpdateForUpdateRecord() {
        Employee__c employee = new Employee__c(
            First_Name__c = 'Name', 
            Last_Name__c='Surname', 
            Birthday__c=system.today(), 
            IT_Department__c='DEV', 
            Level__c='Middle', 	
            Start_Date__c=system.today(),
            Availability__c = 8
        );
        insert employee;
        
        Project__c project1 = new Project__c(
            Name = 'Test',
            Start_Date__c=system.today()
        );
        insert project1;
        
        EmployeeSkills__c emplSk1 = new EmployeeSkills__c(
            Assigned_Time__c = 7, 
            Employee__c = employee.Id, 
  			Project__c = project1.Id
        );
        insert emplSk1;
        
        Test.startTest();
        	emplSk1.Assigned_Time__c = 9;
        	Database.SaveResult result = Database.update(emplSk1, false);
        Test.stopTest();
        
            System.assert(!result.isSuccess());
            System.assert(result.getErrors().size() > 0);
            System.assertEquals('The number of hours(Assigned Times) exceeds hours(availability) of employee.',
                                result.getErrors()[0].getMessage());
    }
}