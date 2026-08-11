import { LightningElement, api, wire } from 'lwc';
import getEligibleJobs from '@salesforce/apex/ApplicationController.getEligibleJobs';
import submitApplication from '@salesforce/apex/ApplicationController.submitApplication';

export default class EligibleJobs extends LightningElement {

    @api studentId;

    jobs = [];
    isLoading = true;
    errorMessage = '';
    successMessage = '';


    // ============================================================
    // GET ELIGIBLE JOBS
    // ============================================================

    @wire(getEligibleJobs, {
        studentId: '$studentId'
    })
    wiredJobs({ data, error }) {

        this.isLoading = false;

        if (data) {

            this.jobs = data;
            this.errorMessage = '';

        } else if (error) {

            this.jobs = [];
            this.errorMessage = this.getErrorMessage(error);

        }
    }


    // ============================================================
    // JOB CARD → ELIGIBLE JOBS
    // ============================================================

    handleApply(event) {

        const jobId = event.detail.jobId;

        this.isLoading = true;
        this.successMessage = '';
        this.errorMessage = '';

        submitApplication({
            studentId: this.studentId,
            jobId: jobId
        })
            .then(() => {

                this.successMessage =
                    'Application submitted successfully.';

                this.dispatchEvent(
                    new CustomEvent('applicationupdated')
                );

            })
            .catch(error => {

                this.errorMessage =
                    this.getErrorMessage(error);

            })
            .finally(() => {

                this.isLoading = false;
            });
    }


    // ============================================================
    // ERROR HANDLING
    // ============================================================

    getErrorMessage(error) {

        if (
            error &&
            error.body &&
            error.body.message
        ) {

            return error.body.message;
        }

        return 'Something went wrong. Please try again.';
    }
}
