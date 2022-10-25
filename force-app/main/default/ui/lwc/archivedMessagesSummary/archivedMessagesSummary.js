import { LightningElement, track} from 'lwc';
import getMessages from '@salesforce/apex/ArchivedMessagesController.getMessages';

export default class ArchivedMessagesSummary extends LightningElement {
    records;
    @track errors;
    searchId = '500xxxxx';

    async retrieveMessages() {
        try {
            let result  = await getMessages({parentId: this.searchId});
            this.records = result;
        } catch (error) {
            this.errors = error;
            this.records = undefined;
        } 
    }

    async connectedCallback() {
        await this.retrieveMessages();
    }
}