import { LightningElement, api, wire } from 'lwc';
import getStudent from '@salesforce/apex/StudentController.getStudent';
import updateStudent from '@salesforce/apex/StudentController.updateStudent';
import { refreshApex } from '@salesforce/apex';

export default class StudentProfile extends LightningElement {

    @api recordId;

    student;
    wiredStudentResult;

    isLoading = true;
    isEditing = false;
    errorMessage = '';
    successMessage = '';

    name = '';
    cgpa;


    // ============================================================
    // GET STUDENT
    // ============================================================

    @wire(getStudent, {
        studentId: '$recordId'
    })
    wiredStudent(result) {

        this.wiredStudentResult = result;

        this.isLoading = false;

        if (result.data) {

            this.student = result.data;

            this.name = result.data.Name;
            this.cgpa = result.data.CGPA__c;

            this.errorMessage = '';

        } else if (result.error) {

            this.student = undefined;
            this.errorMessage = this.getErrorMessage(
                result.error
            );
        }
    }


    // ============================================================
    // ENABLE EDIT MODE
    // ============================================================

    handleEdit() {

        this.isEditing = true;

        this.successMessage = '';
        this.errorMessage = '';
    }


    // ============================================================
    // CANCEL EDIT
    // ============================================================

    handleCancel() {

        this.isEditing = false;

        if (this.student) {

            this.name = this.student.Name;
            this.cgpa = this.student.CGPA__c;
        }

        this.errorMessage = '';
    }


    // ============================================================
    // HANDLE NAME CHANGE
    // ============================================================

    handleNameChange(event) {

        this.name = event.target.value;
    }


    // ============================================================
    // HANDLE CGPA CHANGE
    // ============================================================

    handleCgpaChange(event) {

        this.cgpa = event.target.value;
    }


    // ============================================================
    // UPDATE STUDENT
    // ============================================================

    async handleSave() {

        this.isLoading = true;

        this.successMessage = '';
        this.errorMessage = '';

        if (!this.name || this.cgpa === undefined || this.cgpa === null) {

            this.errorMessage =
                'Name and CGPA are required.';

            this.isLoading = false;

            return;
        }

        if (Number(this.cgpa) < 0 || Number(this.cgpa) > 10) {

            this.errorMessage =
                'CGPA must be between 0 and 10.';

            this.isLoading = false;

            return;
        }

        try {

            await updateStudent({
                studentId: this.recordId,
                studentName: this.name,
                studentCgpa: Number(this.cgpa)
            });

            await refreshApex(
                this.wiredStudentResult
            );

            this.isEditing = false;

            this.successMessage =
                'Student profile updated successfully.';

            this.dispatchEvent(
                new CustomEvent('profileupdated')
            );

        } catch (error) {

            this.errorMessage =
                this.getErrorMessage(error);

        } finally {

            this.isLoading = false;
        }
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
