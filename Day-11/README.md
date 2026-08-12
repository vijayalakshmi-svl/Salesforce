<div align="center">

![Salesforce](https://img.shields.io/badge/Salesforce-Developer-blue?style=for-the-badge&logo=salesforce)
![Apex](https://img.shields.io/badge/Apex-Programming-red?style=for-the-badge)
![LWC](https://img.shields.io/badge/Lightning-Web%20Components-orange?style=for-the-badge)
![REST API](https://img.shields.io/badge/REST-API-green?style=for-the-badge)
![Integration](https://img.shields.io/badge/Salesforce-Integration-purple?style=for-the-badge)
![GitHub](https://img.shields.io/badge/GitHub-Portfolio-blue?style=for-the-badge&logo=github)

</div>

# 🌐 Salesforce Integration — Day 11

## Student Placement Portal — External System Integration

> **Engineering Sprint 11 | Salesforce APIs, REST Integration, Named Credentials and External Systems**

---

# 👩‍💻 Author

**SEERAM VIJAYA LAKSHMI**

B.Tech — **Computer Science and Business Systems**

**Vishnu Institute of Technology**

**Salesforce Developer Bootcamp Participant**

---

# 📌 Overview

The **Student Placement Portal** is extended with an enterprise-style integration layer that allows Salesforce to communicate securely with external recruitment systems.

The integration architecture separates:

- Salesforce business transactions
- Apex processing
- Asynchronous processing
- Authentication
- External API communication
- Error handling
- Retry processing
- Duplicate prevention
- Large-volume synchronization

The main engineering principle followed in this sprint is:

> **Salesforce business operations should remain reliable even when external systems are slow, unavailable, or return errors.**

---

# 🎯 Sprint Objective

The objective of Day 11 is to connect the Student Placement Portal with an external recruitment platform.

The system supports:

- 👨‍🎓 Student information
- 💼 Job information
- 📋 Application information
- 🔄 Candidate synchronization
- 🔐 Secure API authentication
- ⚡ Immediate certification verification
- 🔁 Retry handling
- 🚫 Duplicate prevention
- 📦 Large-volume historical synchronization

---

# 🔌 What is an API?

An API provides a structured way for two software systems to communicate.

The architecture can be represented as:

```text
Salesforce
    │
    │ Request
    ▼
External API
    │
    │ Response
    ▼
Salesforce

# 🚀 Day 11 — Salesforce External API Integration

## 🏗️ High-Level Integration Architecture

Both systems communicate through an agreed API contract. The external system does not need to know Salesforce's internal implementation.

```text
                          👨‍🎓 STUDENT / ADMIN
                                │
                                ▼
                      ┌──────────────────────┐
                      │  Student Placement   │
                      │       Portal         │
                      └──────────┬───────────┘
                                │
               ┌────────────────┼──────────────────┐
               │                │                  │
               ▼                ▼                  ▼
              LWC            Trigger           Scheduler
               │                │                  │
               ▼                ▼                  ▼
             Apex           Queueable           Batch
               │                │                  │
               │                ▼                  │
               │         Named Credential         │
               │                │                  │
               └────────────────┼──────────────────┘
                                │
                                ▼
                       ┌─────────────────┐
                       │  External REST  │
                       │      API        │
                       └────────┬────────┘
                                │
                                ▼
                     External Recruitment
                           Platform


# 🔐 1. Authentication and Credential Layer

External API credentials should not be hard-coded inside Apex.

The integration uses Salesforce credential configuration.

```text
External Credential
        ↓
Principal
        ↓
Permission Set Access
        ↓
Named Credential
        ↓
Apex Callout
        ↓
External API

# 🔑 External Credential

The External Credential represents the authentication configuration required to access the external service.

```text
Recruitment_API_Credential

# 🔗 Named Credential

The Named Credential provides the endpoint configuration used by Apex.

The Queueable class uses:

```text
callout:Recruitment_API/candidates

# 🛡️ Permission Set Access

The Salesforce user must have access to the External Credential principal.

The complete security flow is:

```text
User
 ↓
Permission Set
 ↓
External Credential Principal
 ↓
Named Credential
 ↓
External API

# 🌐 2. REST API Integration

The integration communicates with the external system using HTTP.

The candidate synchronization request uses:

```text
HTTP Method:
POST

# 📦 Request Data

The candidate synchronization payload contains information from the Student, Job, and Application records.

The main information includes:

```text
Student Id
Name
Email
Branch
CGPA
Job Id
Company
Role
Selection Date

# ⚙️ 3. CandidateSyncQueueable

## File

```text
CandidateSyncQueueable.cls

# 🔄 Candidate Synchronization Flow

When an Application becomes selected, candidate synchronization follows this flow:

```text
Application
     ↓
Status = Selected
     ↓
Application Trigger
     ↓
Queueable Apex
     ↓
CandidateSyncQueueable
     ↓
Named Credential
     ↓
External Recruitment API
     ↓
API Response
     ↓
Application Integration Status
