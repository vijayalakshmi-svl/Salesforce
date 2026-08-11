
/**
 * ================================================================
 * StudentController.cls
 * ================================================================
 * Day 10 — LWC Component Architecture & Apex Integration
 *
 * Student Placement Portal
 *
 * Responsibility:
 * - Retrieve student information for LWC
 * - Update student profile information
 * - Provide an Apex bridge for StudentProfile
 * - Keep student business operations on the server
 *
 * Flow:
 *
 * StudentProfile LWC
 *        ↓
 * StudentController
 *        ↓
 * Student__c
 *
 * Author  : SEERAM VIJAYA LAKSHMI
 * College : Vishnu Institute of Technology
 * Branch  : Computer Science and Business Systems
 * Sprint  : Day 10
 * ================================================================
 */

public with sharing class StudentController {

    /**
     * ============================================================
     * GET STUDENT
     * ============================================================
     *
     * Retrieves a student record for the StudentProfile LWC.
     */
    @AuraEnabled(cacheable=true)
    public static Student__c getStudent(Id studentId) {

        if (studentId == null) {
            throw new AuraHandledException(
                'Student ID is required.'
            );
        }

        try {

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
                throw new AuraHandledException(
                    'Student record was not found.'
                );
            }

            return students[0];

        } catch (AuraHandledException ex) {

            throw ex;

        } catch (Exception ex) {

            throw new AuraHandledException(
                'Unable to retrieve student: ' +
                ex.getMessage()
            );
        }
    }


    /**
     * ============================================================
     * UPDATE STUDENT
     * ============================================================
     *
     * Updates the student name and CGPA.
     *
     * Validation:
     * - Student ID required
     * - Student name required
     * - CGPA required
     * - CGPA must be between 0 and 10
     */
    @AuraEnabled
    public static Id updateStudent(
        Id studentId,
        String studentName,
        Decimal studentCgpa
    ) {

        if (studentId == null) {
            throw new AuraHandledException(
                'Student ID is required.'
            );
        }

        if (String.isBlank(studentName)) {
            throw new AuraHandledException(
                'Student name is required.'
            );
        }

        if (studentCgpa == null) {
            throw new AuraHandledException(
                'CGPA is required.'
            );
        }

        if (studentCgpa < 0 || studentCgpa > 10) {
            throw new AuraHandledException(
                'CGPA must be between 0 and 10.'
            );
        }

        try {

            Student__c student = [
                SELECT
                    Id,
                    Name,
                    CGPA__c
                FROM Student__c
                WHERE Id = :studentId
                LIMIT 1
            ];

            student.Name = studentName;
            student.CGPA__c = studentCgpa;

            update student;

            return student.Id;

        } catch (QueryException ex) {

            throw new AuraHandledException(
                'Student record was not found.'
            );

        } catch (DmlException ex) {

            throw new AuraHandledException(
                'Unable to update student: ' +
                ex.getDmlMessage(0)
            );

        } catch (AuraHandledException ex) {

            throw ex;

        } catch (Exception ex) {

            throw new AuraHandledException(
                'Unable to update student: ' +
                ex.getMessage()
            );
        }
    }
}
