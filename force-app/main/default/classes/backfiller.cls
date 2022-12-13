global class backfiller implements Database.Batchable<sObject> {

    String query;

    global backfiller(String q) {
        query = q;
    }

    global Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List<sObject> scope) {

        try{
            update scope;
        } catch (DmlException e) {
            system.debug('Batch Backfill Error --- \n');
            system.debug('Query: ' + query);
            system.debug('Error: ' + e);
        }
    }

    global void finish(Database.BatchableContext BC) {
        // Nothing to do here
    }

    global static void start(string q, integer batchSize) {
        if (batchSize == null || batchSize == 0) batchSize = 200;
        Database.executeBatch (new backfiller(q), batchSize);
    }
}