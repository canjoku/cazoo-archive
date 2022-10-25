// Boolean result = ArchivedMessagesController.restoreMessage('46testID', 'hcidi@ymail.com', 'Talkinga bout dobgs', 'text bpdy here');

// System.debug(result);

RestoredMessage__c createdMessage = [SELECT externalId__c, fromAddress__c, subject__c, textBody__c FROM RestoredMessage__c LIMIT 1];

System.debug(createdMessage);