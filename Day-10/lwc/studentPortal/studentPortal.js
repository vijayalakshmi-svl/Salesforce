import { LightningElement, api, wire } from 'lwc';
import getMyApplications from '@salesforce/apex/ApplicationController.getMyApplications';
import { refreshApex } from '@salesforce/apex';

export default class StudentPortal extends LightningElement {

    @api recordId;

    wiredApplicationsResult;
    isRefreshing = false;

    /**
     * ============================================================
     * GET STUDENT APPLICATIONS
     * ============================================================
     *
     * Parent component coordinates application data.
     *
     * Flow:
     *
     * StudentPortal
     *      ↓
     * @wire
     *      ↓
     * ApplicationController
     *      ↓
     * ApplicationService
     *      ↓
     * Application__c
     */
    @wire(getMyApplications, {
        studentId: '$recordId'
    })
    wiredApplications(result) {

        this.wiredApplicationsResult = result;

        if (result.data) {
            console.log(
                'Applications loaded successfully:',
                result.data
            );
        }

        if (result.error) {
            console.error(
                'Error loading applications:',
                result.error
            );
        }
    }


    /**
     * ============================================================
     * CHILD → PARENT COMMUNICATION
     * ============================================================
     *
     * Receives the profileupdated event from StudentProfile.
     */
    handleProfileUpdated() {

        this.refreshApplicationData();
    }


    /**
     * ============================================================
     * REFRESH WIRED DATA
     * ============================================================
     *
     * refreshApex() retrieves fresh data from Salesforce
     * after a child component modifies the database.
     */
    async refreshApplicationData() {

        if (!this.wiredApplicationsResult) {
            return;
        }

        this.isRefreshing = true;

        try {

            await refreshApex(
                this.wiredApplicationsResult
            );

            console.log(
                'Application data refreshed successfully.'
            );

        } catch (error) {

            console.error(
                'Error refreshing application data:',
                error
            );

        } finally {

            this.isRefreshing = false;
        }
    }


    /**
     * ============================================================
     * REFRESH APPLICATIONS EVENT
     * ============================================================
     *
     * Allows child components to request a refresh.
     */
    handleApplicationUpdated() {

        this.refreshApplicationData();
    }
}
