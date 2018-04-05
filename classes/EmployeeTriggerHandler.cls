public class EmployeeTriggerHandler {
    
    public EmployeeTriggerHandler() {
        this.manage();
    }
 
    public void manage() {
       
        if(Trigger.isInsert && Trigger.isBefore)
        {
            
        }
        else if(Trigger.isInsert && Trigger.isAfter)
        {
 			EmployeeTriggerHelper.OnAfterInsert(Trigger.new);
        }
        else if(Trigger.isUpdate && Trigger.isBefore)
        {
 			
        }
        else if(Trigger.isUpdate && Trigger.isAfter)
        {
 			EmployeeTriggerHelper.OnAfterUpdate(Trigger.new);
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