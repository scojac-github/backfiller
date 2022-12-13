@isTest
private class backfillerTest {
    @isTest static void test_backfiller() {
        Insert new Account(Name = 'Fake Account');
        String qry = 'SELECT Id FROM Account';
        backfiller.start(qry, 200);
    }
}