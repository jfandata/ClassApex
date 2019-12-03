//Populate contact description when user creates contact with message
//'Contact created by trigger'
//Write a test class to verify it works
trigger CreateContactDescription on Contact (before insert) {
    for (Contact con :Trigger.new) {
        con.Description = 'Contact created by trigger';
    }
}