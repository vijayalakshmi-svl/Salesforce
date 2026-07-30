# 🔄 Record-Triggered Flows

A **Record-Triggered Flow** is an automation tool in Salesforce that runs automatically whenever a record is created, updated, or deleted. It helps automate business processes without writing code and improves efficiency within Salesforce.

---

## 📅 Flow 1: Auto Populate Application Date

- **Flow Type:** Before Save Record-Triggered Flow
- **Object:** `Application__c`
- **Trigger:** Record Created

### 🎯 Purpose

- Automatically populates the **Application Date** when a new application record is created.
- Improves performance by updating the record before it is saved to the database.
- Eliminates manual data entry and ensures consistency.

---

## 📧 Flow 2: Send Confirmation Email

- **Flow Type:** After Save Record-Triggered Flow
- **Object:** `Application__c`
- **Trigger:** Record Created

### 🎯 Purpose

- Automatically sends a confirmation email to the Placement Officer after an application is successfully submitted.
- Provides instant notification for better application tracking and communication.
- Reduces manual follow-up efforts.

---

## 📄 Flow 3: Create Offer Letter

- **Flow Type:** After Save Record-Triggered Flow
- **Object:** `Application__c`
- **Trigger:** Record Updated
- **Condition:** `Status = Selected`

### 🎯 Purpose

- Automatically creates an **Offer Letter** record when a student's application status changes to **Selected**.
- Streamlines the placement process by eliminating manual record creation.
- Ensures that selected candidates are processed efficiently.

---

## ✨ Summary

| Flow Name | Trigger | Purpose |
|----------|----------|----------|
| Auto Populate Application Date | Record Created | Automatically sets the Application Date |
| Send Confirmation Email | Record Created | Sends an email notification to the Placement Officer |
| Create Offer Letter | Record Updated | Creates an Offer Letter when the status is Selected |

---

> 🚀 These Record-Triggered Flows demonstrate how Salesforce declarative automation can efficiently handle business processes while following the **"Clicks Before Code"** approach.
