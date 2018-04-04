trigger EmployeeSkillsTrigger on EmployeeSkills__c (
	before insert,
    before update,
    before delete,
    after insert,
    after update,
    after delete,
    after undelete) {
        
	new EmployeeSkillsTriggerHandler();
}