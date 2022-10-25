import { LightningElement, track} from 'lwc';
import getMessages from '@salesforce/apex/ArchivedMessagesController.getMessages';

export default class ArchivedMessagesSummary extends LightningElement {
    @track records;
    @track error;
    title = 'Archived Messages'
    searchId = '500xxxxx';

    async retrieveMessages() {
        try {
            let result  = await getMessages({parentId: this.searchId});
            this.records = result;
            console.log(result);
        } catch (error) {
            this.error = error;
            this.records = undefined;
        } 
    }

    async connectedCallback() {
        await this.retrieveMessages();
        console.log('connectec callsed')
    }
}