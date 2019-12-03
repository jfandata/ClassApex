global class batch_Ext_Convert implements Database.Batchable<sObject>{
        global String Query;
        global List<Id> idList;
    global batch_Ext_Convert(String q, List<Id> ids){
        Query = q;
        idList = ids;
    }
    global Database.QueryLocator start(Database.BatchableContext BC){
        system.debug(Query);
        return Database.getQueryLocator(Query);
    }
    global void execute(Database.BatchableContext BC, List<Ext_Convert__c> scope){
        List<Account> newAccs = new List<Account>();
        List<Contact> newCons = new List<Contact>();
        system.debug(scope);
        for(Ext_Convert__c record : scope){
            Account acc = new Account();
            Contact con = new Contact();
            acc.Name = record.Company__c;
            acc.Website = record.Website__c;
            acc.Phone = record.Phone__c;
            //acc.BillingAddress = record.Address__c;
            //con.FirstName =
            //con.LastName =
            //con.MailingAddress = record.Address__c;
            newAccs.add(acc);
            newCons.add(con);
        }
        insert newAccs;
        insert newCons;
    }
    global void finish(Database.BatchableContext BC){
    }
}
