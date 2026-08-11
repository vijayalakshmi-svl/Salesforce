
import { LightningElement, api } from 'lwc';

export default class JobCard extends LightningElement {

    @api job;

    get jobName() {
        return this.job?.Name || 'Job Opportunity';
    }

    get companyName() {
        return this.job?.Company__c || 'Company Not Available';
    }

    get minimumCgpa() {
        return this.job?.Minimum_CGPA__c || 'Not Specified';
    }

    get closingDate() {
        return this.job?.Closing_Date__c || 'Not Specified';
    }

    handleApply() {

        this.dispatchEvent(
            new CustomEvent('apply', {
                detail: {
                    jobId: this.job.Id
                }
            })
        );
    }
}
