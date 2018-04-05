public class EmployeeSkillsTriggerHandler {
    
	public EmployeeSkillsTriggerHandler() {
        this.manage();
    }
 
    public void manage() {
       
        if(Trigger.isInsert && Trigger.isBefore)
        {
            
        }
        else if(Trigger.isInsert && Trigger.isAfter)
        {
 			EmployeeSkillsTriggerHelper.OnAfterInsertUpdate(Trigger.New);
        }
        else if(Trigger.isUpdate && Trigger.isBefore)
        {
			
        }
        else if(Trigger.isUpdate && Trigger.isAfter)
        {
 			EmployeeSkillsTriggerHelper.OnAfterInsertUpdate(Trigger.New);
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