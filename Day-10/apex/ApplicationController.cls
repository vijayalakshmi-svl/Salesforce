/**
 * ================================================================
 * ApplicationController.cls
 * ================================================================
 * Day 10 — LWC Component Architecture & Apex Integration
 *
 * Student Placement Portal
 *
 * Responsibility:
 * - Acts as the communication bridge between LWC and Apex Service
 * - Exposes server-side methods to Lightning Web Components
 * - Routes requests to ApplicationService
 * - Keeps business logic outside the controller
 *
 * Architecture:
 *
 * LWC
 *   ↓
 * ApplicationController
 *   ↓
 * ApplicationService
 *   ↓
 * Salesforce Database
 *
 * Author  : SEERAM VIJAYA LAKSHMI
 * College : Vishnu Institute of Technology
 * Branch  : Computer Science and Business Systems
 * Sprint  : Day 10
 * ================================================================
 */

public with sharing class ApplicationController {

    /**
     * ============================================================
     * GET ELIGIBLE JOBS
     * ============================================================
     *
     * Retrieves jobs that are available for the student.
     *
     * Called from:
     * eligibleJobs LWC
     *
     * Communication:
     *
     * LWC
     *   ↓
     * ApplicationController
     *   ↓
     * ApplicationService
     *   ↓
     * Job__c
     *
     * cacheable=true allows the method to be used with
     * the LWC @wire service.
     */
    @AuraEnabled(cacheable=true)
    public static List<Job__c> getEligibleJobs(Id studentId) {

        if (studentId == null) {
            throw new AuraHandledException(
                'Student ID is required to retrieve eligible jobs.'
            );
        }

        try {

            return ApplicationService.getEligibleJobs(studentId);

        } catch (Exception ex) {

            throw new AuraHandledException(
                'Unable to retrieve eligible jobs: ' +
                ex.getMessage()
            );
        }
    }


    /**
     * ============================================================
     * SUBMIT APPLICATION
     * ============================================================
     *
     * Submits a student's application for a selected job.
     *
     * Called when:
     *
     * Student
     *   ↓
     * Clicks Apply
     *   ↓
     * LWC
     *   ↓
     * Imperative Apex
     *   ↓
     * ApplicationController
     *   ↓
     * ApplicationService
     *
     * The controller does NOT contain the complete business logic.
     * It delegates processing to ApplicationService.
     */
    @AuraEnabled
    public static Id submitApplication(
        Id studentId,
        Id jobId
    ) {

        if (studentId == null) {
            throw new AuraHandledException(
                'Student ID is required.'
            );
        }

        if (jobId == null) {
            throw new AuraHandledException(
                'Job ID is required.'
            );
        }

        try {

            return ApplicationService.submitApplication(
                studentId,
                jobId
            );

        } catch (AuraHandledException ex) {

            throw ex;

        } catch (Exception ex) {

            throw new AuraHandledException(
                'Unable to submit application: ' +
                ex.getMessage()
            );
        }
    }


    /**
     * ============================================================
     * GET MY APPLICATIONS
     * ============================================================
     *
     * Retrieves applications submitted by a particular student.
     *
     * Used by:
     * myApplications LWC
     *
     * Flow:
     *
     * MyApplications
     *       ↓
     * ApplicationController
     *       ↓
     * ApplicationService
     *       ↓
     * Application__c
     */
    @AuraEnabled(cacheable=true)
    public static List<Application__c> getMyApplications(
        Id studentId
    ) {

        if (studentId == null) {
            throw new AuraHandledException(
                'Student ID is required.'
            );
        }

        try {

            return ApplicationService.getMyApplications(
                studentId
            );

        } catch (Exception ex) {

            throw new AuraHandledException(
                'Unable to retrieve applications: ' +
                ex.getMessage()
            );
        }
    }
}
