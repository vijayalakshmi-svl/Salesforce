import { LightningElement, api, wire } from 'lwc';
import getMyApplications from '@salesforce/apex/ApplicationController.getMyApplications';

export default class MyApplications extends LightningElement {

    @api studentId;

    applications = [];
    isLoading = true;
    errorMessage = '';


    // ============================================================
    // GET STUDENT APPLICATIONS
    // ============================================================

    @wire(getMyApplications, {
        studentId: '$studentId'
    })
    wiredApplications({ data, error }) {

        this.isLoading = false;

        if (data) {

            this.applications = data;
            this.errorMessage = '';

        } else if (error) {

            this.applications = [];
            this.errorMessage =
                this.getErrorMessage(error);
        }
    }


    // ============================================================
    // CHECK APPLICATIONS
    // ============================================================

    get hasApplications() {

        return this.applications.length > 0;
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

        return 'Unable to load your applications.';
    }
}
