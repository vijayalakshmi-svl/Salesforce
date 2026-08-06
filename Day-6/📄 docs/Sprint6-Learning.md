# 📘 Sprint 6 Learning Journal

## Chapter 6 - Making Software Respond Automatically

---

# 📅 Sprint Information

**Sprint:** 6

**Module:** Apex Triggers

**Project:** Placement Management System

**Platform:** Salesforce

---

# 🎯 Sprint Goal

The objective of this sprint was to understand how Salesforce automatically responds to business events using Apex Triggers while following Enterprise Architecture principles.

Unlike previous sprints where users manually initiated actions, this sprint introduced automation through event-driven programming.

---

# 📖 What I Learned

During this sprint I learned that enterprise software is designed to react automatically whenever important business events occur.

Instead of asking users to remember every business process, Salesforce uses Apex Triggers to automate repetitive operations.

Some important business events include:

- Student submits an application
- Recruiter updates application status
- Company publishes a new job
- Student accepts an offer
- Placement status changes

Each event can automatically trigger business processes.

---

# 💡 New Concepts Learned

## Apex Triggers

Apex Triggers are event-driven programs that execute automatically whenever records are inserted, updated, deleted, or restored.

---

## Event Driven Architecture

Instead of waiting for user instructions, enterprise applications continuously monitor important business events.

Whenever an event occurs, the application automatically performs predefined actions.

---

## Business Event Thinking

Professional Salesforce developers think differently.

Instead of asking

> Which button was clicked?

They ask

> Which business event occurred?

This mindset helps build scalable enterprise software.

---

## Trigger vs Service

One of the most valuable lessons from this sprint was understanding the difference between Triggers and Service Classes.

### Trigger

Responsible for:

- Observing events
- Calling services
- Coordinating execution

### Service

Responsible for:

- Business rules
- Validation
- Decision making
- Processing records

This separation keeps the application clean and maintainable.

---

# ⚙ Practical Work Completed

During this sprint I implemented:

## Apex Class

ApplicationService.cls

Implemented:

- Duplicate Validation
- CGPA Validation
- Closing Date Validation
- Application Submission

---

## Apex Trigger

ApplicationTrigger.trigger

Implemented:

- Before Insert Trigger
- Trigger Delegation
- Service Layer Architecture

---

# 🛠 Salesforce CLI Commands Used

```bash
sf org login web

sf org list

sf org open

sf config set target-org MyOrg

sf project deploy start --source-dir force-app/main/default/classes

sf project deploy start --source-dir force-app/main/default/triggers

sf project deploy start --source-dir force-app/main/default/classes --source-dir force-app/main/default/triggers
```

---

# 🧠 Problems Faced

During implementation I encountered several issues.

### Missing Trigger Metadata

Problem

Trigger was not visible inside Salesforce.

Solution

Created

ApplicationTrigger.trigger-meta.xml

---

### Deployment Errors

Problem

Deployment failed because the Trigger called a method that did not exist.

Solution

Implemented

validateApplications()

inside ApplicationService.

---

### Wrong Folder Structure

Problem

Metadata files were placed in incorrect folders.

Solution

Organized the project using Salesforce DX folder structure.

---

### Multiple Salesforce Orgs

Problem

Worked with multiple Salesforce Developer Orgs while helping classmates.

Solution

Learned to manage org aliases and switch between default orgs using Salesforce CLI.

---

# 📈 Skills Improved

- Apex Programming

- Apex Triggers

- SOQL

- DML

- Salesforce CLI

- Enterprise Architecture

- Service Layer Pattern

- Debugging

- Metadata Deployment

- Project Organization

---

# 🏗 Architecture Learned

```
Business Event

        │

        ▼

ApplicationTrigger

        │

        ▼

ApplicationService

        │

        ▼

Business Validation

        │

        ▼

Salesforce Database
```

---

# 📚 Best Practices

Throughout this sprint I learned several engineering best practices.

- Keep Triggers Small

- Keep Business Logic Inside Service Classes

- Use One Trigger Per Object

- Write Reusable Methods

- Avoid Duplicate Code

- Design for Scalability

- Separate Responsibilities

- Improve Maintainability

---

# 🎤 Interview Preparation

Important interview topics covered:

- What is an Apex Trigger?

- Difference between Before and After Trigger

- Trigger vs Workflow

- Trigger vs Flow

- Trigger vs Apex Class

- Service Layer Pattern

- Event Driven Architecture

- Separation of Concerns

- Trigger Best Practices

---

# 🚀 Key Takeaways

The biggest lesson from this sprint is that automation should begin with business events rather than user actions.

A Trigger should never become a large class filled with business logic.

Instead, it should simply observe an event and delegate the work to specialized Service Classes.

This architecture improves readability, maintainability, scalability, and follows enterprise Salesforce development practices.

---

# ✅ Sprint Outcome

Successfully implemented:

- ApplicationService

- ApplicationTrigger

- Enterprise Trigger Architecture

- Service Layer Pattern

- Event Driven Programming

- Business Validation

- Automatic Trigger Execution

---

# 📌 Next Learning Goal

In the next sprint I plan to learn:

- Bulk Processing

- Governor Limits

- Trigger Optimization

- Bulkified Apex Code

- Enterprise Trigger Framework

- Advanced SOQL
