# ✅ Validation Rules

## 📌 Definition

A **Validation Rule** in Salesforce ensures that the data entered by users follows predefined business requirements. If the data violates any rule, Salesforce prevents the record from being saved and displays an appropriate error message.

Validation Rules help maintain data integrity and improve the overall quality of records within the system.

---

## 🎓 Validation Rule 1: Student CGPA Eligibility

### Requirement

- The student's CGPA must be greater than or equal to the minimum CGPA required for the selected job.

### Formula

```text
Student__r.CGPA__c < Job__r.Minimum_CGPA__c
```

### Purpose

- Ensures that only eligible students can apply for a job.
- Prevents applications from students who do not meet the minimum CGPA criteria.
- Maintains fairness and adherence to placement requirements.

---

## 📅 Validation Rule 2: Application Date Validation

### Requirement

- The Application Date cannot be later than the Job Closing Date.

### Formula

```text
Application_Date__c > Job__r.Closing_Date__c
```

### Purpose

- Prevents students from applying after the application deadline.
- Ensures compliance with job application timelines.
- Improves the accuracy of application records.

---

## ⚠️ Validation Rule 3: Mandatory Field Validation

### Requirement

- Mandatory fields must not be left blank.

### Formula

```text
OR(
    ISBLANK(Student__c),
    ISBLANK(Job__c),
    ISBLANK(Application_Date__c)
)
```

### Purpose

- Ensures that all required information is provided before saving the record.
- Prevents incomplete application submissions.
- Improves data consistency across the Placement Management System.

---

## ✨ Summary

| Validation Rule | Purpose |
|----------------|---------|
| Student CGPA Validation | Checks whether the student meets the minimum CGPA requirement. |
| Application Date Validation | Prevents applications after the job closing date. |
| Mandatory Field Validation | Ensures that all required fields are filled. |

---

> 🚀 These Validation Rules help maintain data accuracy, enforce business requirements, and improve the reliability of the Placement Management System.
