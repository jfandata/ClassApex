//Create a contact for the user that creates a task
//With subject 'Say hi to **CONTACT NAME**'
//That has not been started with HIGH Priority
//Relate the task to the contact object
//Write a test class to verify it works
trigger RemindUserToGreetNewContact on Contact (after insert) {
   for (Contact con : Trigger.new) {
       Task aTask = new Task ();
       aTask.Description = 'Say hi to ' + con.LastName;
       aTask.Status = 'Not started';
       aTask.Priority = 'High';
       aTask.WhoId = con.Id;

       insert aTask;
   }
}