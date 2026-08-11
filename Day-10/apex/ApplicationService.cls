/**
 * ================================================================
 * ApplicationService.cls
 * ================================================================
 * Day 10 — LWC Component Architecture & Apex Integration
 *
 * Student Placement Portal
 *
 * Responsibility:
 * - Contains application business logic
 * - Retrieves eligible jobs
 * - Validates student and job records
 * - Validates CGPA requirements
 * - Prevents duplicate applications
 * - Validates application deadlines
 * - Creates Application__c records
 * - Retrieves student applications
 *
 * Architecture:
 *
 * LWC
 *   ↓
 * ApplicationController
 *   ↓
 * ApplicationService
 *   ↓
 * Validation + Business Rules
 *   ↓
 * SOQL / DML
 *   ↓
 * Salesforce Database
 *
 * Author  : SEERAM VIJAYA LAKSHMI
 * College : Vishnu Institute of Technology
 * Branch  : Computer Science and Business Systems
 * Sprint  : Day 10
 * ================================================================
 */

public with sharing class ApplicationService {

    /**
     * ============================================================
     * GET ELIGIBLE JOBS
     * ============================================================
     *
     * Retrieves active jobs for a student based on:
     *
     * 1. Student existence
     * 2. Minimum CGPA requirement
     * 3. Application closing date
     *
     * This method is called by ApplicationController.
     */
    public static List<Job__c> getEligibleJobs(Id studentId) {

        Student__c student = getStudent(studentId);

        if (student == null) {
            throw new AuraHandledException(
                'Student record was not found.'
            );
        }

        return [
            SELECT
                Id,
                Name,
                Company__c,
                Minimum_CGPA__c,
                Closing_Date__c
            FROM Job__c
            WHERE Closing_Date__c >= :Date.today()
            AND Minimum_CGPA__c <= :student.CGPA__c
            ORDER BY Closing_Date__c ASC
        ];
    }


    /**
     * ============================================================
     * SUBMIT APPLICATION
     * ============================================================
     *
     * Main business operation for creating an application.
     *
     * Processing flow:
     *
     * Student
     *   ↓
     * Validate Student
     *   ↓
     * Validate Job
     *   ↓
     * Validate CGPA
     *   ↓
     * Validate Deadline
     *   ↓
     * Check Duplicate
     *   ↓
     * Create Application
     */
    public static Id submitApplication(
        Id studentId,
        Id jobId
    ) {

        // --------------------------------------------------------
        // STEP 1 — Validate Student
        // --------------------------------------------------------

        Student__c student = getStudent(studentId);

        if (student == null) {
            throw new AuraHandledException(
                'Student record was not found.'
            );
        }


        // --------------------------------------------------------
        // STEP 2 — Validate Job
        // --------------------------------------------------------

        Job__c job = getJob(jobId);

        if (job == null) {
            throw new AuraHandledException(
                'Job record was not found.'
            );
        }


        // --------------------------------------------------------
        // STEP 3 — Validate CGPA
        // --------------------------------------------------------

        if (
            student.CGPA__c == null ||
            job.Minimum_CGPA__c == null ||
            student.CGPA__c < job.Minimum_CGPA__c
        ) {
            throw new AuraHandledException(
                'Student does not meet the minimum CGPA requirement.'
            );
        }


        // --------------------------------------------------------
        // STEP 4 — Validate Closing Date
        // --------------------------------------------------------

        if (
            job.Closing_Date__c == null ||
            job.Closing_Date__c < Date.today()
        ) {
            throw new AuraHandledException(
                'The application deadline for this job has expired.'
            );
        }


        // --------------------------------------------------------
        // STEP 5 — Prevent Duplicate Application
        // --------------------------------------------------------

        if (isDuplicateApplication(studentId, jobId)) {
            throw new AuraHandledException(
                'You have already applied for this job.'
            );
        }


        // --------------------------------------------------------
        // STEP 6 — Create Application
        // --------------------------------------------------------

        Application__c application = new Application__c();

        application.Student__c = studentId;
        application.Job__c = jobId;
        application.Status__c = 'Applied';
        application.Application_Date__c = Date.today();

        insert application;


        // --------------------------------------------------------
        // STEP 7 — Return Created Record ID
        // --------------------------------------------------------

        return application.Id;
    }


    /**
     * ============================================================
     * GET MY APPLICATIONS
     * ============================================================
     *
     * Retrieves applications belonging to the current student.
     */
    public static List<Application__c> getMyApplications(
        Id studentId
    ) {

        if (studentId == null) {
            throw new AuraHandledException(
                'Student ID is required.'
            );
        }

        return [
            SELECT
                Id,
                Name,
                Student__c,
                Student__r.Name,
                Job__c,
                Job__r.Name,
                Job__r.Company__c,
                Status__c,
                Application_Date__c
            FROM Application__c
            WHERE Student__c = :studentId
            ORDER BY Application_Date__c DESC
        ];
    }


    /**
     * ============================================================
     * GET STUDENT
     * ============================================================
     *
     * Retrieves a student record by Id.
     */
    private static Student__c getStudent(Id studentId) {

        if (studentId == null) {
            return null;
        }

        List<Student__c> students = [
            SELECT
                Id,
                Name,
                CGPA__c
            FROM Student__c
            WHERE Id = :studentId
            LIMIT 1
        ];

        if (students.isEmpty()) {
            return null;
        }

        return students[0];
    }


    /**
     * ============================================================
     * GET JOB
     * ============================================================
     *
     * Retrieves a job record by Id.
     */
    private static Job__c getJob(Id jobId) {

        if (jobId == null) {
            return null;
        }

        List<Job__c> jobs = [
            SELECT
                Id,
                Name,
                Company__c,
                Minimum_CGPA__c,
                Closing_Date__c
            FROM Job__c
            WHERE Id = :jobId
            LIMIT 1
        ];

        if (jobs.isEmpty()) {
            return null;
        }

        return jobs[0];
    }


    /**
     * ============================================================
     * DUPLICATE APPLICATION CHECK
     * ============================================================
     *
     * Ensures that one student cannot apply for the same job
     * more than once.
     *
     * Business Rule:
     *
     * Student + Job = One Application
     */
    private static Boolean isDuplicateApplication(
        Id studentId,
        Id jobId
    ) {

        List<Application__c> existingApplications = [
            SELECT Id
            FROM Application__c
            WHERE Student__c = :studentId
            AND Job__c = :jobId
            LIMIT 1
        ];

        return !existingApplications.isEmpty();
    }
}
