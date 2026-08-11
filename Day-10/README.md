# 🚀 Day 10 – LWC Component Architecture & Apex Integration

<p align="center">
  <strong>Student Placement Portal</strong>
  <br>
  <em>Building a Scalable Placement Experience with Salesforce LWC & Apex</em>
</p>

<div align="center">

![Salesforce](https://img.shields.io/badge/Salesforce-Platform-0D9DDA?style=for-the-badge&logo=salesforce&logoColor=white)
![Platform](https://img.shields.io/badge/Salesforce-Platform-blue?style=for-the-badge&logo=salesforce&logoColor=white)
![LWC](https://img.shields.io/badge/Lightning-Web%20Components-00A1E0?style=for-the-badge&logo=salesforce&logoColor=white)
![Apex](https://img.shields.io/badge/Apex-Programming-E04444?style=for-the-badge)
![Architecture](https://img.shields.io/badge/Component-Architecture-8E44AD?style=for-the-badge)
![Apex Integration](https://img.shields.io/badge/Apex-Integration-39B900?style=for-the-badge)
![Bootcamp](https://img.shields.io/badge/Bootcamp-Day%2010-E67E22?style=for-the-badge)

</div>

---

# 👩‍💻 Author

**SEERAM VIJAYA LAKSHMI**

B.Tech — **Computer Science and Business Systems**

**Vishnu Institute of Technology**

**Salesforce Developer Bootcamp Participant**

---

# 🎯 Sprint Objectives

The major objectives of Day 10 are:

- Understand scalable LWC component architecture
- Build reusable Lightning Web Components
- Understand Parent-to-Child communication
- Implement Child-to-Parent communication
- Use `@api` for public properties
- Use Custom Events for component communication
- Retrieve Salesforce data using `@wire`
- Perform user-triggered operations using Imperative Apex
- Understand `refreshApex`
- Connect LWC components with Apex Controllers
- Implement an Apex Service Layer
- Separate request routing from business logic
- Implement server-side business validation
- Prevent duplicate job applications
- Validate student eligibility
- Validate minimum CGPA requirements
- Validate job closing dates
- Create and manage Salesforce records using Apex
- Build reusable Job Card components
- Build reusable Status Badge components
- Build reusable Empty State components
- Handle loading, success, empty and error states
- Implement Apex test classes
- Debug LWC and Apex integration
- Document a scalable Salesforce architecture

---

# 📚 Topics Covered

| Topic | Status |
|---|:---:|
| Lightning Web Components | ✅ |
| Component-Based Architecture | ✅ |
| Parent Component | ✅ |
| Child Components | ✅ |
| Reusable Components | ✅ |
| `@api` | ✅ |
| `@wire` | ✅ |
| Imperative Apex | ✅ |
| `refreshApex` | ✅ |
| Parent-to-Child Communication | ✅ |
| Child-to-Parent Communication | ✅ |
| Custom Events | ✅ |
| Apex Controller | ✅ |
| Apex Service Layer | ✅ |
| `@AuraEnabled` | ✅ |
| SOQL | ✅ |
| DML | ✅ |
| Business Logic | ✅ |
| Student Validation | ✅ |
| Job Validation | ✅ |
| CGPA Validation | ✅ |
| Deadline Validation | ✅ |
| Duplicate Application Prevention | ✅ |
| Application Creation | ✅ |
| Status Badge | ✅ |
| Empty State | ✅ |
| Apex Test Classes | ✅ |
| Error Handling | ✅ |
| UI Refresh | ✅ |
| Debugging | ✅ |
| Salesforce Deployment | ✅ |

---

# 🏢 Business Problem

Students need a centralized platform where they can:

1. View available placement opportunities
2. Understand job requirements
3. Identify eligible opportunities
4. Check company information
5. Compare minimum CGPA requirements
6. View application deadlines
7. Apply for suitable jobs
8. Receive validation feedback
9. Prevent duplicate applications
10. Track submitted applications
11. View application status

The **Student Placement Portal** is designed to represent this complete placement workflow inside Salesforce.

---

# 💡 Solution

The solution uses a **component-based Salesforce architecture** where each Lightning Web Component has a specific responsibility.

Apex handles server-side processing, business rules and Salesforce database operations.

```text
                    STUDENT PLACEMENT PORTAL
                              │
                              ▼
                       StudentPortal
                              │
              ┌───────────────┼───────────────┐
              │               │               │
              ▼               ▼               ▼
       StudentSummary   StudentProfile   EligibleJobs
                                              │
                                      ┌───────┴───────┐
                                      ▼               ▼
                                   JobCard        EmptyState
              │
              ▼
       MyApplications
              │
       ┌──────┼─────────┐
       ▼      ▼         ▼
 Application Status   EmptyState
   Card       Badge
              │
              ▼
          Apex Layer
              │
              ▼
       Salesforce Data
