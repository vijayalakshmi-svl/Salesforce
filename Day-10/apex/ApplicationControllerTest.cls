/**
 * ================================================================
 * ApplicationControllerTest.cls
 * ================================================================
 * Day 10 — LWC Component Architecture & Apex Integration
 *
 * Student Placement Portal
 *
 * Purpose:
 * - Test ApplicationController
 * - Test ApplicationService
 * - Validate successful application creation
 * - Validate duplicate application prevention
 * - Validate CGPA validation
 * - Validate job deadline validation
 * - Validate eligible job retrieval
 * - Validate student application retrieval
 *
 * Author  : SEERAM VIJAYA LAKSHMI
 * College : Vishnu Institute of Technology
 * Branch  : Computer Science and Business Systems
 * Sprint  : Day 10
 * ================================================================
 */

@IsTest
private class ApplicationControllerTest {

    /**
     * ============================================================
     * TEST DATA SETUP
     * ============================================================
     */
    @TestSetup
    static void createTestData() {

        Student__c student = new Student__c(
            Name = 'Test Student',
            CGPA__c = 8.5
        );

        insert student;


        Job__c eligibleJob = new Job__c(
            Name = 'Salesforce Developer',
            Company__c = 'Salesforce',
            Minimum_CGPA__c = 7.5,
            Closing_Date__c = Date.today().addDays(10)
        );

        insert eligibleJob;


        Job__c lowCgpaJob = new Job__c(
            Name = 'Advanced Developer',
            Company__c = 'Technology Company',
            Minimum_CGPA__c = 9.0,
            Closing_Date__c = Date.today().addDays(10)
        );

        insert lowCgpaJob;


        Job__c expiredJob = new Job__c(
            Name = 'Expired Opportunity',
            Company__c = 'Old Company',
            Minimum_CGPA__c = 7.0,
            Closing_Date__c = Date.today().addDays(-1)
        );

        insert expiredJob;
    }


    /**
     * ============================================================
     * TEST 01 — GET ELIGIBLE JOBS
     * ============================================================
     */
    @IsTest
    static void testGetEligibleJobs() {

        Student__c student = [
            SELECT Id
            FROM Student__c
            WHERE Name = 'Test Student'
            LIMIT 1
        ];

        Test.startTest();

        List<Job__c> jobs =
            ApplicationController.getEligibleJobs(student.Id);

        Test.stopTest();

        System.assertNotEquals(
            null,
            jobs,
            'Eligible jobs should not be null.'
        );

        System.assertEquals(
            1,
            jobs.size(),
            'Only the job matching the student CGPA and deadline should be returned.'
        );

        System.assertEquals(
            'Salesforce Developer',
            jobs[0].Name,
            'The eligible Salesforce Developer job should be returned.'
        );
    }


    /**
     * ============================================================
     * TEST 02 — VALID APPLICATION
     * ============================================================
     */
    @IsTest
    static void testValidApplication() {

        Student__c student = [
            SELECT Id
            FROM Student__c
            WHERE Name = 'Test Student'
            LIMIT 1
        ];

        Job__c job = [
            SELECT Id
            FROM Job__c
            WHERE Name = 'Salesforce Developer'
            LIMIT 1
        ];

        Test.startTest();

        Id applicationId =
            ApplicationController.submitApplication(
                student.Id,
                job.Id
            );

        Test.stopTest();

        System.assertNotEquals(
            null,
            applicationId,
            'A valid application should return an Application Id.'
        );


        Application__c application = [
            SELECT
                Id,
                Student__c,
                Job__c,
                Status__c,
                Application_Date__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];

        System.assertEquals(
            student.Id,
            application.Student__c,
            'Application should belong to the correct student.'
        );

        System.assertEquals(
            job.Id,
            application.Job__c,
            'Application should belong to the correct job.'
        );

        System.assertEquals(
            'Applied',
            application.Status__c,
            'New applications should have Applied status.'
        );

        System.assertEquals(
            Date.today(),
            application.Application_Date__c,
            'Application date should be today.'
        );
    }


    /**
     * ============================================================
     * TEST 03 — DUPLICATE APPLICATION
     * ============================================================
     */
    @IsTest
    static void testDuplicateApplication() {

        Student__c student = [
            SELECT Id
            FROM Student__c
            WHERE Name = 'Test Student'
            LIMIT 1
        ];

        Job__c job = [
            SELECT Id
            FROM Job__c
            WHERE Name = 'Salesforce Developer'
            LIMIT 1
        ];


        // First application
        ApplicationController.submitApplication(
            student.Id,
            job.Id
        );


        Boolean exceptionThrown = false;


        Test.startTest();

        try {

            // Second application should fail
            ApplicationController.submitApplication(
                student.Id,
                job.Id
            );

        } catch (AuraHandledException ex) {

            exceptionThrown = true;
        }

        Test.stopTest();


        System.assertEquals(
            true,
            exceptionThrown,
            'Duplicate applications should be rejected.'
        );
    }


    /**
     * ============================================================
     * TEST 04 — INVALID CGPA
     * ============================================================
     */
    @IsTest
    static void testInvalidCgpa() {

        Student__c student = [
            SELECT Id
            FROM Student__c
            WHERE Name = 'Test Student'
            LIMIT 1
        ];

        Job__c job = [
            SELECT Id
            FROM Job__c
            WHERE Name = 'Advanced Developer'
            LIMIT 1
        ];


        Boolean exceptionThrown = false;


        Test.startTest();

        try {

            ApplicationController.submitApplication(
                student.Id,
                job.Id
            );

        } catch (AuraHandledException ex) {

            exceptionThrown = true;
        }

        Test.stopTest();


        System.assertEquals(
            true,
            exceptionThrown,
            'Application should be rejected when CGPA is below the requirement.'
        );
    }


    /**
     * ============================================================
     * TEST 05 — EXPIRED JOB
     * ============================================================
     */
    @IsTest
    static void testExpiredJob() {

        Student__c student = [
            SELECT Id
            FROM Student__c
            WHERE Name = 'Test Student'
            LIMIT 1
        ];

        Job__c job = [
            SELECT Id
            FROM Job__c
            WHERE Name = 'Expired Opportunity'
            LIMIT 1
        ];


        Boolean exceptionThrown = false;


        Test.startTest();

        try {

            ApplicationController.submitApplication(
                student.Id,
                job.Id
            );

        } catch (AuraHandledException ex) {

            exceptionThrown = true;
        }

        Test.stopTest();


        System.assertEquals(
            true,
            exceptionThrown,
            'Applications for expired jobs should be rejected.'
        );
    }


    /**
     * ============================================================
     * TEST 06 — GET MY APPLICATIONS
     * ============================================================
     */
    @IsTest
    static void testGetMyApplications() {

        Student__c student = [
            SELECT Id
            FROM Student__c
            WHERE Name = 'Test Student'
            LIMIT 1
        ];

        Job__c job = [
            SELECT Id
            FROM Job__c
            WHERE Name = 'Salesforce Developer'
            LIMIT 1
        ];


        // Create application
        ApplicationController.submitApplication(
            student.Id,
            job.Id
        );


        Test.startTest();

        List<Application__c> applications =
            ApplicationController.getMyApplications(
                student.Id
            );

        Test.stopTest();


        System.assertNotEquals(
            null,
            applications,
            'Applications should not be null.'
        );

        System.assertEquals(
            1,
            applications.size(),
            'Student should have one application.'
        );

        System.assertEquals(
            student.Id,
            applications[0].Student__c,
            'Application should belong to the requested student.'
        );

        System.assertEquals(
            job.Id,
            applications[0].Job__c,
            'Application should belong to the selected job.'
        );
    }


    /**
     * ============================================================
     * TEST 07 — NULL STUDENT ID
     * ============================================================
     */
    @IsTest
    static void testNullStudentId() {

        Boolean exceptionThrown = false;


        Test.startTest();

        try {

            ApplicationController.getEligibleJobs(null);

        } catch (AuraHandledException ex) {

            exceptionThrown = true;
        }

        Test.stopTest();


        System.assertEquals(
            true,
            exceptionThrown,
            'Null Student Id should be rejected.'
        );
    }


    /**
     * ============================================================
     * TEST 08 — NULL JOB ID
     * ============================================================
     */
    @IsTest
    static void testNullJobId() {

        Student__c student = [
            SELECT Id
            FROM Student__c
            WHERE Name = 'Test Student'
            LIMIT 1
        ];


        Boolean exceptionThrown = false;


        Test.startTest();

        try {

            ApplicationController.submitApplication(
                student.Id,
                null
            );

        } catch (AuraHandledException ex) {

            exceptionThrown = true;
        }

        Test.stopTest();


        System.assertEquals(
            true,
            exceptionThrown,
            'Null Job Id should be rejected.'
        );
    }
}
