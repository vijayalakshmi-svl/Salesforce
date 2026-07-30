# Salesforce 30 Days Training – Placement Management System Automation

## Project Overview

The Placement Management System Automation project enhances the Salesforce-based placement process by leveraging Record-Triggered Flows, Validation Rules, and Apex Triggers. The primary objective is to automate application-related processes, maintain data integrity, and improve the overall efficiency of placement management.

---

## Features Implemented

### 1. Record-Triggered Flow

The following processes are automated using Salesforce Record-Triggered Flows:

- Automatically populates the Application Date when a new Application record is created.
- Sends a confirmation email notification to the Placement Officer whenever an application is submitted.
- Automatically creates an Offer Letter record when the Application Status is updated to **"Selected"**.

---

### 2. Validation Rules

The following validation checks are implemented to ensure data accuracy and consistency:

- Student CGPA must be greater than or equal to the Job's Minimum CGPA requirement.
- Application Date cannot be later than the Job Closing Date.
- Mandatory fields must not be left blank before saving the record.

---

### 3. Apex Trigger

An Apex Trigger is implemented to prevent duplicate applications by:

- Ensuring that the same student cannot apply for the same job more than once.

---

### 4. Offer Letter Automation

Offer Letter creation is automated as part of the placement workflow:

- When an Application record's Status changes to **"Selected"**, an Offer Letter record is automatically generated.

---

## Screenshots Included

The project documentation includes the following screenshots:

- Flow Canvas
- Start Element Configuration
- Assignment Element Configuration
- Email Action Configuration
- Successful Flow Execution
- Validation Rule Formulas
- Successful Validation Rule Execution
- Offer Letter Record Creation (if implemented)

---

## Assignment Questions and Answers

### 1. Which requirements did you solve using Flow?

The following requirements were implemented using Record-Triggered Flows:

- Automatically populate the Application Date.
- Send an email notification to the Placement Officer.
- Automatically create an Offer Letter record when the Application Status changes to **"Selected"**.

---

### 2. Which requirements required Validation Rules?

The following business validations were implemented using Validation Rules:

- Student CGPA must meet or exceed the Job's Minimum CGPA requirement.
- Application Date cannot be after the Job Closing Date.
- Mandatory fields cannot be left blank.

---

### 3. Which requirements still needed Apex?

The following requirement was implemented using an Apex Trigger:

- Prevent duplicate applications by verifying whether the same student has already applied for the same job.

---

### 4. Why did you choose those solutions?

#### Record-Triggered Flow

Flows provide an efficient no-code approach for automating business processes such as:

- Updating field values automatically.
- Sending email notifications.
- Creating related records without writing code.

#### Validation Rules

Validation Rules help maintain data quality by:

- Preventing invalid or incomplete data from being saved.
- Enforcing business rules consistently across records.

#### Apex Trigger

An Apex Trigger was selected because:

- Preventing duplicate applications requires querying existing records in the Salesforce database.
- This logic is beyond the capabilities of simple Validation Rules and is best handled through Apex.

---

## Technologies Used

- Salesforce Record-Triggered Flows
- Salesforce Validation Rules
- Apex Triggers
- Salesforce Objects and Relationships
- Email Automation
- Offer Letter Record Automation

---

## Outcome

This project successfully automates key placement management processes within Salesforce, improves data integrity through validation mechanisms, and enhances the overall user experience by reducing manual effort and preventing duplicate or invalid applications.
