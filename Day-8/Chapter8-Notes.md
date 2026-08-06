# 📘 Chapter 8 Notes – Asynchronous Apex

---

# 📌 Introduction

Asynchronous Apex allows processes to run in the background instead of executing immediately. This improves system performance and prevents users from waiting for long-running operations.

Salesforce provides four different ways to execute asynchronous code.

- 🚀 Future Methods
- 🚀 Queueable Apex
- 🚀 Batch Apex
- 🚀 Scheduled Apex

These are essential concepts for enterprise-level Salesforce development.

---

# ❓ Why Asynchronous Apex?

In real-world applications, some tasks require more time to complete.

Examples include:

- Sending emails
- Processing thousands of records
- Calling external APIs
- Generating reports
- Data migration
- Nightly scheduled jobs

Running these tasks synchronously may exceed Salesforce Governor Limits or slow down the user experience.

Asynchronous Apex solves this problem by executing work in the background.

---

# ⚡ Types of Asynchronous Apex

| Feature | Purpose |
|---------|----------|
| Future Method | Execute lightweight background tasks |
| Queueable Apex | Execute complex background jobs |
| Batch Apex | Process large datasets |
| Scheduled Apex | Execute jobs automatically at scheduled times |

---

# 🚀 Future Methods

Future Methods are used to execute simple background operations.

### Syntax

```apex
@future
public static void methodName(){

}
```

### Characteristics

- Runs asynchronously
- Static methods only
- Returns void
- Cannot accept sObjects
- Suitable for callouts and email processing

---

# 🚀 Queueable Apex

Queueable Apex provides more flexibility than Future Methods.

It allows:

- Passing complex objects
- Job monitoring
- Job chaining

### Syntax

```apex
public class DemoQueueable implements Queueable{

    public void execute(QueueableContext context){

    }

}
```

---

# 🔗 Queueable Chaining

One Queueable Job can start another Queueable Job.

Example:

```
OfferProcessingJob
        │
        ▼
NotificationProcessingJob
```

Advantages:

- Modular design
- Better scalability
- Cleaner architecture

---

# 📦 Batch Apex

Batch Apex processes records in smaller chunks instead of processing everything at once.

Lifecycle:

```
start()

↓

execute()

↓

finish()
```

Benefits:

- Handles millions of records
- Reduces Governor Limit issues
- Efficient for bulk operations

---

# ⏰ Scheduled Apex

Scheduled Apex executes jobs automatically at a specified time.

Uses CRON Expressions.

Example:

```apex
System.schedule(
    'Daily Job',
    cronExpression,
    new MyScheduler()
);
```

Typical Use Cases:

- Daily cleanup
- Weekly reports
- Monthly data synchronization
- Automatic reminders

---

# 📊 Apex Jobs

Salesforce provides the Apex Jobs page to monitor asynchronous execution.

It displays:

- Job Type
- Status
- Created Date
- Completion Time

---

# 📅 Scheduled Jobs

Scheduled jobs can be viewed under:

```
Setup

↓

Scheduled Jobs
```

This page displays:

- Job Name
- Frequency
- Next Run Time
- Owner

---

# 🛡 Governor Limits

Although asynchronous processing provides higher limits than synchronous Apex, Governor Limits still apply.

Examples include:

- CPU Time
- Heap Size
- SOQL Queries
- DML Statements

Developers should always write efficient code.

---

# 🏆 Best Practices

- ✔ Use Future Methods only for simple operations.
- ✔ Prefer Queueable Apex over Future Methods for new development.
- ✔ Use Batch Apex for processing large datasets.
- ✔ Schedule recurring operations using Scheduled Apex.
- ✔ Avoid unnecessary SOQL and DML operations.
- ✔ Monitor Apex Jobs regularly.
- ✔ Handle exceptions properly.

---

# 🎯 Interview Questions

### 1. What is Asynchronous Apex?

Background processing in Salesforce that executes tasks independently of the user's request.

---

### 2. Difference between Future Method and Queueable Apex?

Future Methods support only primitive parameters.

Queueable Apex supports complex objects and job chaining.

---

### 3. When should Batch Apex be used?

When processing thousands or millions of records.

---

### 4. What is Queueable Chaining?

Executing one Queueable Job from another Queueable Job.

---

### 5. What is Scheduled Apex?

Running Apex automatically at a predefined schedule using CRON expressions.

---

# 📚 Summary

In this chapter, I learned:

- Future Methods
- Queueable Apex
- Queueable Chaining
- Batch Apex
- Scheduled Apex
- Apex Jobs
- Scheduled Jobs
- Enterprise Asynchronous Processing
- Salesforce Best Practices

---

# ✅ Sprint Outcome

By completing this chapter, I gained practical experience in implementing asynchronous processing techniques used in enterprise Salesforce applications.
