# 📚 Lightning Web Components — Learning Notes

## 🚀 Day 9 | Salesforce Lightning Web Components

> **Engineering Sprint 09 — Student Placement Portal**

---

# 👩‍💻 Author

**SEERAM VIJAYA LAKSHMI**

B.Tech — Computer Science & Business Systems  
**Vishnu Institute of Technology**

**Salesforce Developer Bootcamp Participant**

> Learning • Building • Growing 🚀

---

# 🎯 Introduction

Lightning Web Components (LWC) is Salesforce's modern framework for building fast, reusable, and modular user interfaces on the Salesforce Platform.

LWC uses standard web technologies such as:

- HTML
- JavaScript
- CSS
- Web Components
- ES6+ JavaScript
- Salesforce Lightning Base Components

In Day 9, LWC concepts were studied and applied to a **Student Placement Portal**.

The portal demonstrates how independent components can communicate with each other, retrieve Salesforce data, interact with Apex, manage UI state, and implement a complete student application workflow.

---

# 🧠 What is Lightning Web Components?

Lightning Web Components is a Salesforce framework based on modern Web Components standards.

Instead of building one large user interface, an application can be divided into smaller reusable components.

```text
Student Placement Portal
        │
        ├── Placement Home
        │
        ├── Placement Dashboard
        │
        ├── Eligible Jobs
        │       │
        │       └── Job Card
        │
        └── My Applications
