@isTest
private class EmployeeSkillsTest2 {
     @testSetup static void setup() {
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
         
		EmployeeSkills__c emplSk = new EmployeeSkills__c(
            Assigned_Time__c = 7, 
            Employee__c = employee.Id, 
  			Project__c = project1.Id
        );
         
        insert emplSk;        
     }

    
    @isTest 
    static void TestOnAfterInsertUpdateForUpdateRecord() { 
        Date d = system.today();
        Id prId = [SELECT Id FROM Project__c WHERE Name = 'Test'].Id;
        Id empId = [SELECT Id FROM Employee__c WHERE  First_Name__c = 'Name' AND Last_Name__c='Surname' AND Birthday__c=: d].Id ;
        EmployeeSkills__c emplSk = [
            SELECT Id, Assigned_Time__c 
            FROM EmployeeSkills__c 
            WHERE Employee__c =: empId AND  Project__c =: prId  ];
        
        Test.startTest();
        	emplSk.Assigned_Time__c = 9;
        	Database.SaveResult result = Database.update(emplSk, false);
        Test.stopTest();
        
            System.assert(!result.isSuccess());
            System.assert(result.getErrors().size() > 0);
            System.assertEquals('The number of hours(Assigned Times) exceeds hours(availability) of employee.',
                                result.getErrors()[0].getMessage());
    }
    
    
    @isTest 
    static void TestOnAfterInsertUpdateList() {
        Date d = system.today();
        Id prId = [SELECT Id FROM Project__c WHERE Name = 'Test'].Id;
        Id empId = [SELECT Id FROM Employee__c WHERE  First_Name__c = 'Name' AND Last_Name__c='Surname' AND Birthday__c=: d].Id ;
        
        EmployeeSkills__c emplSk1 = new EmployeeSkills__c(
            Assigned_Time__c = 7, 
            Employee__c = empId, 
  			Project__c = prId
        );
        EmployeeSkills__c emplSk2 = new EmployeeSkills__c(
            Assigned_Time__c = 2, 
            Employee__c = empId, 
  			Project__c = prId
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
}