@is@TestSetup
private class backfiller {
    @isTest static void backfillerTest() {
        insert new Account(Name = 'Fake Account');
        string q = 'SELECT Id FROM Account';
        backfiller.start(q, null);
    }
}