# 📝 Apply Workflow — Day 9

**Student Placement Portal — Lightning Web Components**

> **Engineering Sprint 09 | Salesforce LWC**

---

# 👩‍💻 Author

**SEERAM VIJAYA LAKSHMI**

B.Tech — Computer Science & Business Systems  
**Vishnu Institute of Technology**

**Salesforce Developer Bootcamp Participant**

> Learning • Building • Growing 🚀

---

# 📌 Overview

The **Apply Workflow** represents the complete student application journey
implemented in the Student Placement Portal.

It connects the Lightning Web Components frontend with the Salesforce Apex
business layer to process a student's application for an eligible placement
opportunity.

The workflow is designed to provide:

- Clear job selection
- Student selection
- Application submission
- Business validation
- Duplicate application prevention
- CGPA eligibility validation
- Application deadline validation
- Success and error handling
- Application record creation
- Updated application visibility

---

# 🎯 Workflow Objective

The primary objective is to create a reliable application process where a
student can apply for a suitable placement opportunity while Salesforce
validates the request before creating the application record.

```text
Student
   │
   ▼
View Eligible Jobs
   │
   ▼
Select Job
   │
   ▼
Click Apply
   │
   ▼
Select Student
   │
   ▼
Submit Application
   │
   ▼
Apex Business Layer
   │
   ▼
Business Validation
   │
   ├── Duplicate Check
   ├── CGPA Check
   └── Deadline Check
   │
   ▼
Create Application
   │
   ▼
Success Response
   │
   ▼
Refresh Application Data
   │
   ▼
My Applications
