# 🚀 Day 9 – Lightning Web Components in Salesforce

<p align="center">
  <strong>Student Placement Portal</strong>
  <br>
  <em>Building an Interactive Placement Experience with Salesforce LWC</em>
</p>
<div align="center">

![Salesforce](https://img.shields.io/badge/Salesforce-Platform-blue?style=for-the-badge&logo=salesforce)
![LWC](https://img.shields.io/badge/Lightning-Web%20Components-00A1E0?style=for-the-badge&logo=salesforce)
![Apex](https://img.shields.io/badge/Apex-Integration-red?style=for-the-badge)
![Components](https://img.shields.io/badge/Component-Based%20Architecture-purple?style=for-the-badge)
![Bootcamp](https://img.shields.io/badge/Bootcamp-Day%209-orange?style=for-the-badge)

</div>

---

# 👩‍💻 Author

**SEERAM VIJAYA LAKSHMI**

B.Tech — Computer Science & Business Systems  
**Vishnu Institute of Technology**

**Salesforce Developer Bootcamp Participant**

---

## 🎯 Sprint Objectives

The major objectives of Day 9 were:

- Understand the architecture of Lightning Web Components
- Build reusable and modular LWC components
- Understand component lifecycle and state management
- Implement Parent-to-Child communication
- Implement Child-to-Parent communication
- Use `@api` for public properties and methods
- Use Custom Events for component communication
- Retrieve Salesforce data using `@wire`
- Perform user-triggered operations using Imperative Apex
- Connect LWC components with Apex controllers
- Build reusable job-card interfaces
- Implement student application workflows
- Implement application validations
- Display application information dynamically
- Handle loading, success, empty and error states
- Refresh UI after data modification
- Test and debug LWC components
- Deploy the completed Salesforce implementation

---

# 📚 Topics Covered

| Topic | Status |
|---|:---:|
| Lightning Web Components | ✅ |
| Component-Based Architecture | ✅ |
| LWC Folder Structure | ✅ |
| HTML Templates | ✅ |
| JavaScript Controllers | ✅ |
| Component Metadata | ✅ |
| `@api` | ✅ |
| `@wire` | ✅ |
| Imperative Apex | ✅ |
| Parent-to-Child Communication | ✅ |
| Child-to-Parent Communication | ✅ |
| Custom Events | ✅ |
| Component Reusability | ✅ |
| Component State Management | ✅ |
| Job Card Component | ✅ |
| Placement Dashboard | ✅ |
| Placement Home | ✅ |
| Eligible Jobs | ✅ |
| My Applications | ✅ |
| Application Submission | ✅ |
| Duplicate Application Validation | ✅ |
| CGPA Validation | ✅ |
| Deadline Validation | ✅ |
| Loading States | ✅ |
| Error Handling | ✅ |
| UI Refresh | ✅ |
| Apex Integration | ✅ |
| LWC Testing | ✅ |
| Debugging | ✅ |
| Salesforce Deployment | ✅ |

---

# 🏢 Business Problem

Students need a centralized platform where they can:

1. View available placement opportunities
2. Understand job requirements
3. Identify eligible opportunities
4. Select a suitable job
5. Submit an application
6. Receive validation feedback
7. Track submitted applications
8. View application status

The Student Placement Portal was designed to represent this workflow inside Salesforce.

---

# 💡 Solution

The solution uses a component-based Salesforce architecture where different LWC components are responsible for different parts of the placement experience.

```text
                    STUDENT PLACEMENT PORTAL
                              │
                              ▼
                       Placement Home
                              │
              ┌───────────────┴───────────────┐
              ▼                               ▼
         Eligible Jobs                  My Applications
              │                               │
              ▼                               ▼
           Job Card                     Application Data
              │
              ▼
       Application Action
              │
              ▼
        Apex Business Layer
              │
              ▼
        Salesforce Data
