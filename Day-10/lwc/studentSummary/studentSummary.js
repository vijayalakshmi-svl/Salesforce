import { LightningElement, api, wire } from 'lwc';

import getStudent from '@salesforce/apex/StudentController.getStudent';

import getMyApplications from '@salesforce/apex/ApplicationController.getMyApplications';


export default class StudentSummary extends LightningElement {

    @api studentId;

    student;

    applications = [];

    isLoading = true;

    errorMessage = '';


    // ============================================================
    // GET STUDENT INFORMATION
    // ============================================================

    @wire(getStudent, {
        studentId: '$studentId'
    })
    wiredStudent({ data, error }) {

        if (data) {

            this.student = data;

            this.errorMessage = '';

        } else if (error) {

            this.student = undefined;

            this.errorMessage =
                this.getErrorMessage(error);
        }

        this.isLoading = false;
    }


    // ============================================================
    // GET APPLICATIONS
    // ============================================================

    @wire(getMyApplications, {
        studentId: '$studentId'
    })
    wiredApplications({ data, error }) {

        if (data) {

            this.applications = data;

        } else if (error) {

            this.applications = [];

            if (!this.errorMessage) {

                this.errorMessage =
                    this.getErrorMessage(error);
            }
        }
    }


    // ============================================================
    // APPLICATION COUNT
    // ============================================================

    get applicationCount() {

        return this.applications
            ? this.applications.length
            : 0;
    }


    // ============================================================
    // HAS APPLICATIONS
    // ============================================================

    get hasApplications() {

        return this.applicationCount > 0;
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

        return 'Unable to load student information.';
    }
}
