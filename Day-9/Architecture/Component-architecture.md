
# 🏗️ Component Architecture — Day 9

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

The Student Placement Portal is designed using a **component-based
architecture** with clear separation of responsibilities between the
Lightning Web Components, Apex Controller, Application Service, and
Salesforce database.

The architecture follows one important engineering principle:

> **The UI requests. The business layer decides.**

The Lightning Web Components are responsible for presentation,
interaction, component state, and communication.

The Apex and service layers are responsible for business rules,
validation, and database operations.

---

# 🎯 Architectural Objective

The objective is to create a placement experience where students can:

- 👨‍🎓 View their placement-related information
- 💼 View eligible jobs
- 🔎 Understand job requirements
- 🧩 Interact with reusable Job Cards
- 🖱️ Apply for jobs
- ⏳ Receive processing feedback
- ✅ Receive application confirmation
- 📋 View submitted applications

The user should not need to understand the complexity of the
underlying Salesforce architecture.

---

# 🏗️ High-Level Architecture

```text
                         👨‍🎓 STUDENT
                              │
                              ▼
                   ┌─────────────────────┐
                   │ Placement Dashboard │
                   └──────────┬──────────┘
                              │
                ┌─────────────┴─────────────┐
                │                           │
                ▼                           ▼
       ┌─────────────────┐        ┌─────────────────┐
       │  Eligible Jobs  │        │ My Applications │
       └────────┬────────┘        └─────────────────┘
                │
                ▼
          ┌───────────┐
          │  Job Card │
          └─────┬─────┘
                │
         Custom Event
                │
                ▼
       ┌────────────────────┐
       │ PlacementController│
       └──────────┬─────────┘
                  │
                  ▼
       ┌────────────────────┐
       │ ApplicationService │
       └──────────┬─────────┘
                  │
                  ▼
       ┌────────────────────┐
       │ Business Validation│
       └──────────┬─────────┘
                  │
                  ▼
       ┌────────────────────┐
       │ Salesforce Database│
       └──────────┬─────────┘
                  │
                  ▼
              UI Update
