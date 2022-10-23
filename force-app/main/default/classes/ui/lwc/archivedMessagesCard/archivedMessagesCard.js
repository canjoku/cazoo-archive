import { LightningElement } from 'lwc';
import getMessages from '@salesforce/apex/ArchivedMessagesController.getMessages';
import restoreMessage from '@salesforce/apex/ArchivedMessagesController.restoreMessage';

export default class ArchivedMessagesCard extends LightningElement {}