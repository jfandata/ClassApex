@isTest 
 private class CreateContactDescriptionTest { 
     @isTest static void changeDescription() { 
        Contact con = new Contact();

        con.LastName = 'test';

        insert con;

        Contact newCon = [SELECT Description 
                            FROM Contact 
                            WHERE LastName = 'Test' 
                            LIMIT 1];

        System.assertEquals('Contact created by trigger', newCon.Description);
        //System.assertEquals('Test', newCon.LastName);
    }
}