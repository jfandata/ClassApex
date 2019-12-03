//Populate contact description when user creates contact with message
//'Contact created by user **INSERT USERNAME**'
//Write a test class to verify it works
trigger CreateCustomContactDescription on Contact (after insert) {
    // for (Contact con:Trigger.new){

    //     //CreatedById
    //     con.Description = 'Contact created by user ' + con.CreatedById;

    //     update con;
    // }

}