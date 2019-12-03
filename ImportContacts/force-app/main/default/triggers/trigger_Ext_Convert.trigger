trigger trigger_Ext_Convert on Ext_Convert__c (before insert, after insert) {
   if(trigger.isAfter){
        if(trigger.isInsert){
            if(trigger.isInsert){
            SObjectType sObjType = Schema.getGlobalDescribe().get('Ext_Convert__c');
            Map<String,Schema.SObjectField> sObjfields = sObjType.getDescribe().fields.getMap();
            system.debug(sObjfields.values());
            List<Id> idList = new List<Id>();
            for(Ext_Convert__c record : trigger.new){
                idList.add(record.Id);
            }
            String Fields;
            for(String value : sObjfields.keyset()){
                Fields += value+', ';
            }
            String Query = 'SELECT '+ Fields.removeEnd(', ').removeStart('null').remove('clonesourceid, ') +' FROM '+'Ext_Convert__c ';
            //+'WHERE '+'Id IN :idList';
            batch_Ext_Convert runConvert = new batch_Ext_Convert(Query, idList);
            Id BatchProcessId = Database.ExecuteBatch(runConvert);
            // List<Ext_Convert__c> recToPurge = trigger.new;
            // delete recToPurge;
            }else if(trigger.isUpdate){
            }
        }
    }
}