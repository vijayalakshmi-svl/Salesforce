import { LightningElement, api } from 'lwc';

export default class ApplicationCard extends LightningElement {

    @api application;


    // ============================================================
    // APPLICATION DETAILS
    // ============================================================

    get jobName() {

        return this.application?.Job__r?.Name
            || 'Job Not Available';
    }


    get companyName() {

        return this.application?.Job__r?.Company__c
            || 'Company Not Available';
    }


    get applicationDate() {

        return this.application?.Application_Date__c
            || 'Not Available';
    }


    get status() {

        return this.application?.Status__c
            || 'Unknown';
    }


    // ============================================================
    // STATUS TYPE
    // ============================================================

    get isApplied() {

        return this.status === 'Applied';
    }


    get isPending() {

        return this.status === 'Pending';
    }


    get isSelected() {

        return this.status === 'Selected';
    }


    get isRejected() {

        return this.status === 'Rejected';
    }
}
