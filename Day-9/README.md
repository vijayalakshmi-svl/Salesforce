# 🚀 Day 9 – Lightning Web Components in Salesforce

<p align="center">
  <strong>Student Placement Portal</strong>
  <br>
  <em>Building an Interactive Placement Experience with Salesforce LWC</em>
</p>

---

# 👩‍💻 Author

**SEERAM VIJAYA LAKSHMI**

B.Tech — Computer Science & Business Systems  
**Vishnu Institute of Technology**

**Salesforce Developer Bootcamp Participant**

---

# 📌 Sprint Overview

Day 9 focuses on **Lightning Web Components (LWC)** and building an
interactive **Student Placement Portal** using Salesforce.

The sprint connects the LWC frontend with the existing Apex backend
architecture and implements a complete placement application workflow.

---

# 🎯 Learning Objectives

By completing this sprint, I learned how to:

- ✅ Build reusable Lightning Web Components
- ✅ Use `@api` and `@wire`
- ✅ Implement Imperative Apex
- ✅ Implement Parent-to-Child communication
- ✅ Implement Child-to-Parent communication
- ✅ Use Custom Events
- ✅ Build reusable Job Card components
- ✅ Manage LWC component state
- ✅ Handle Loading, Success and Error states
- ✅ Implement application submission
- ✅ Apply business validations
- ✅ Display submitted applications
- ✅ Refresh UI after data changes
- ✅ Debug LWC components
- ✅ Deploy LWC and Apex components

---

# 📚 Main Topics Covered

| Topic | Status |
|---|:---:|
| Lightning Web Components | ✅ |
| Component Architecture | ✅ |
| `@api` | ✅ |
| `@wire` | ✅ |
| Imperative Apex | ✅ |
| Parent–Child Communication | ✅ |
| Custom Events | ✅ |
| Job Card Component | ✅ |
| Application Workflow | ✅ |
| Duplicate Validation | ✅ |
| CGPA Validation | ✅ |
| Deadline Validation | ✅ |
| UI State Management | ✅ |
| My Applications | ✅ |
| Testing & Verification | ✅ |
| Debugging | ✅ |
| Deployment | ✅ |

---

# 🛠️ Practical Implementation

The Student Placement Portal was developed using reusable LWC
components and an Apex service architecture.

| Component / Class | Purpose |
|---|---|
| `eligibleJobs` | Displays eligible jobs and manages the application flow |
| `jobCard` | Displays individual job information |
| `myApplications` | Displays submitted applications |
| `placementDashboard` | Provides the placement dashboard |
| `PlacementController` | Connects LWC with Apex |
| `ApplicationService` | Handles application business logic |

---

# 🔄 Application Flow

```text
Student
   ↓
Placement Dashboard
   ↓
Eligible Jobs
   ↓
Job Card
   ↓
Apply
   ↓
Select Student
   ↓
Submit Application
   ↓
Business Validation
   ↓
Application Record
   ↓
Success
   ↓
My Applications
