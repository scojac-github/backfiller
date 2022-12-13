# Backfiller 🚜

Imagine you've created a new piece of automation that will use some logic to populate a new field on a Salesforce record. How do you force all records to update to populate this new field? Backfiller to the rescue.

A simple Batch Apex class to update the records you define.

## How to

In this example, we'll use Anonymous Apex to call Backfiller to update all Cases in our org. We'll start by using a SOQL query to define the records to update (only an Id field is needed). Next we'll set the batch size (or leave blank and it will set to system default batch size of 200). Finally, we'll execute the batch.

`
String myQuery = 'SELECT Id FROM Case'

Integer batchSize = 99;

Backfiller.Start(myQuery, batchSize);
`
