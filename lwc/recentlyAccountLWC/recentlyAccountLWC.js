import { LightningElement, track } from 'lwc';
import recentlyAccounts from '@salesforce/apex/RecentlyAccountLWCController.recentlyAccounts';

export default class RecentlyAccountLWC extends LightningElement {
    @track accountList = new Array();

    connectedCallback() {
        this.showSpinner = true;
        recentlyAccounts().then(result => {
            this.accountList = result;
            this.showSpinner = false;

        }).catch(error => {
            this.showSpinner = false;
        })
    }

    get coloumns() {
        return [{ label: 'Name', fieldName: 'Name' },
        { label: 'Phone', fieldName: 'Phone', type: 'phone' ,  cellAttributes: { alignment: 'center' }} ,
        { label: 'Number Of Contacts', fieldName: 'Number_of_Contacts__c' ,  cellAttributes: { alignment: 'center' }}
        ]
    }
}