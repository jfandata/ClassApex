@isTest 
 private class CreateCustomContactDescriptionTest { 
     @isTest static void changeDescription() { 
        Contact con = new Contact();
        con.LastName = 'Test';

        insert con;

        Contact newCon = [SELECT Description, CreatedByID
                            FROM Contact
                            WHERE LastName = 'Test'
                            LIMIT 1];
        System.assertEquals('Contact created by user ' + newCon.CreatedById, newCon.Description);
    }
}
