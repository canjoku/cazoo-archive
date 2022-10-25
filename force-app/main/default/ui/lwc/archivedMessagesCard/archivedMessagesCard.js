import { LightningElement, api } from 'lwc';
import createMessage from '@salesforce/apex/ArchivedMessagesController.restoreMessage';

export default class ArchivedMessagesCard extends LightningElement {
@api record
@api error;
buttonTitle = 'Restore Message'
    async restoreMessage() {
        try {
            await createMessage({externalId: this.record.externalId, fromAddress: this.record.fromAddress, subject: this.record.subject, textBody: this.record.textBody});
        } catch (error) {
            this.error = error;
        }
        
    }

    async handleRestoreMessage() {
        if (this.buttonTitle = 'Restore Message') {
            await this.restoreMessage();
            this.buttonTitle = 'Saved';
        }
    }
}