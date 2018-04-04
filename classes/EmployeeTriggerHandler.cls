public class EmployeeTriggerHandler {
    
    public EmployeeTriggerHandler() {
        this.manage();
    }
 
    public void manage() {
       
        if(Trigger.isInsert && Trigger.isBefore)
        {
            EmployeeTriggerHelper.OnBeforeInsertUpdate(Trigger.new);
        }
        else if(Trigger.isInsert && Trigger.isAfter)
        {
 
        }
        else if(Trigger.isUpdate && Trigger.isBefore)
        {
 			EmployeeTriggerHelper.OnBeforeInsertUpdate(Trigger.new);
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