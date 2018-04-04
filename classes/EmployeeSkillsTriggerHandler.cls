public class EmployeeSkillsTriggerHandler {
    
	public EmployeeSkillsTriggerHandler() {
        this.manage();
    }
 
    public void manage() {
       
        if(Trigger.isInsert && Trigger.isBefore)
        {
            EmployeeSkillsTriggerHelper.OnBeforeInsertUpdate(Trigger.New);
        }
        else if(Trigger.isInsert && Trigger.isAfter)
        {
 
        }
        else if(Trigger.isUpdate && Trigger.isBefore)
        {
			EmployeeSkillsTriggerHelper.OnBeforeInsertUpdate(Trigger.New);
        }
        else if(Trigger.isUpdate && Trigger.isAfter)
        {
 
        }
        else if(Trigger.isDelete && Trigger.isBefore)
        {
 
        }
        else if(Trigger.isDelete && Trigger.isAfter)
        {
 
        }
        else if(Trigger.isundelete)
        {
           
        }
    }
}