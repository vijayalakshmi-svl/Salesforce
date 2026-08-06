# 📅 Sprint 7 Learning Journal

![Salesforce](https://img.shields.io/badge/Salesforce-Sprint_7-blue?style=for-the-badge&logo=salesforce)
![Learning](https://img.shields.io/badge/Learning-In_Progress-success?style=for-the-badge)
![Apex](https://img.shields.io/badge/Apex-Bulkification-orange?style=for-the-badge)

---

# 🎯 Sprint Goal

The objective of Sprint 7 was to understand how Salesforce processes multiple records and how to design scalable Apex applications using Bulkification.

This sprint introduced Governor Limits, Collection Thinking, Trigger Handler Architecture, and Bulk Processing.

---

# 📚 Topics Covered

- ✅ Governor Limits
- ✅ Multi-Tenant Architecture
- ✅ Bulkification
- ✅ Collection Thinking
- ✅ SOQL Best Practices
- ✅ DML Best Practices
- ✅ Lists
- ✅ Sets
- ✅ Maps
- ✅ Trigger.new
- ✅ Trigger.old
- ✅ Trigger.oldMap
- ✅ Trigger Handler Pattern

---

# 💻 Practical Activities

## Apex Development

Successfully completed:

- Created `ApplicationTriggerHandler.cls`
- Updated `ApplicationTrigger.trigger`
- Updated `ApplicationService.cls`
- Deployed all metadata successfully using Salesforce CLI

---

## Salesforce Developer Console

Performed the following practical exercises using Execute Anonymous:

### SOQL Query

Executed a SOQL query to retrieve Account records and viewed the output in the Debug Log.

---

### List Example

Created and displayed a List collection.

```apex
List<String> cities = new List<String>{
    'Hyderabad',
    'Chennai',
    'Delhi'
};
```

---

### Set Example

Created a Set collection and observed automatic duplicate removal.

```apex
Set<String> skills = new Set<String>();

skills.add('Apex');
skills.add('SOQL');
skills.add('Apex');
```

---

### Map Example

Created a Map collection using key-value pairs.

```apex
Map<Integer,String> numbers = new Map<Integer,String>();

numbers.put(1,'One');
numbers.put(2,'Two');
```

---

# 🧠 Key Learnings

During this sprint I learned that:

- Salesforce executes Triggers in bulk.
- Governor Limits protect shared resources.
- SOQL queries should never be placed inside loops.
- DML statements should never be placed inside loops.
- Lists are used for processing multiple records.
- Sets remove duplicate values.
- Maps provide fast record lookup.
- Trigger Handler Architecture improves code maintainability.
- Bulkification is essential for scalable Salesforce applications.

---

# ⚠️ Challenges Faced

- Understanding Bulk Processing
- Understanding Collection Thinking
- Trigger Handler implementation
- Salesforce CLI deployment configuration
- Default Org configuration
- Deployment errors caused by incorrect metadata files

---

# ✅ Solutions Implemented

- Configured the default Salesforce Org.
- Fixed metadata deployment issues.
- Successfully deployed Trigger and Apex Classes.
- Verified Apex Classes and Apex Trigger in Salesforce.
- Executed practical examples in Developer Console.

---

# 📸 Screenshots Included

The following screenshots are stored in the **Screenshots** folder:

- ApplicationTriggerHandler.cls
- ApplicationTrigger.trigger
- Successful Deployment
- Apex Classes
- Apex Trigger
- Execute Anonymous (SOQL)
- Debug Log
- List Output
- Set Output
- Map Output

---

# 🎯 Interview Questions Practiced

### What are Governor Limits?

Restrictions imposed by Salesforce to ensure fair resource usage in a multi-tenant environment.

---

### What is Bulkification?

The process of writing Apex code that efficiently processes multiple records in a single transaction.

---

### Why should SOQL not be used inside loops?

Because it may exceed the maximum number of SOQL queries allowed in one transaction.

---

### Why should DML not be used inside loops?

Because multiple DML statements may exceed Salesforce Governor Limits.

---

### Why are Maps used in Apex?

Maps allow fast retrieval of records using a unique key.

---

# 🏆 Sprint Outcome

Successfully completed the foundation of scalable Apex development by understanding Governor Limits, Bulkification, Collection Thinking, and Trigger Handler Architecture.

This sprint significantly improved my understanding of enterprise-level Salesforce development.

---

# 🌟 Reflection

Sprint 7 taught me that writing code that simply works is not enough.

A good Salesforce developer writes code that is scalable, efficient, maintainable, and capable of processing hundreds of records without violating Governor Limits.

> **"Think in Collections, Query Once, Update Once."**
