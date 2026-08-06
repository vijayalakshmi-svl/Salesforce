# 🚀 Bulkification in Salesforce

![Salesforce](https://img.shields.io/badge/Salesforce-Bulkification-blue?style=for-the-badge&logo=salesforce)
![Governor Limits](https://img.shields.io/badge/Governor-Limits-red?style=for-the-badge)
![Apex](https://img.shields.io/badge/Apex-Best_Practice-success?style=for-the-badge)

---

# 📖 What is Bulkification?

Bulkification is the process of writing Apex code that can efficiently process **multiple records** in a single transaction.

Instead of designing code for one record, Salesforce developers design applications to process hundreds of records together.

---

# 🎯 Why is Bulkification Important?

Salesforce executes Triggers in bulk.

For example,

```
1 Record

↓

Trigger Executes
```

Everything works perfectly.

Now imagine

```
200 Records

↓

Trigger Executes

↓

Governor Limits
```

If the code is not bulkified, it fails.

---

# ☁️ Salesforce Multi-Tenant Architecture

Salesforce is a **multi-tenant platform**.

Many organizations share the same infrastructure.

```
🏢 Company A

🏢 Company B

🏢 Company C

        │

        ▼

☁️ Salesforce Platform
```

To prevent one organization from consuming excessive resources, Salesforce enforces **Governor Limits**.

---

# 🚦 Governor Limits

| Resource | Limit |
|----------|------:|
| SOQL Queries | 100 |
| DML Statements | 150 |
| Records Retrieved | 50,000 |
| Records Updated | 10,000 |
| CPU Time | 10 Seconds |

---

# ❌ Bad Design

## SOQL Inside Loop

```apex
for(Application__c app : Trigger.new){

    Student__c student = [
        SELECT Id
        FROM Student__c
        WHERE Id=:app.Student__c
    ];

}
```

### Problem

```
200 Records

↓

200 Queries

↓

Governor Limit Exceeded ❌
```

---

## DML Inside Loop

```apex
for(Application__c app : applications){

    update app;

}
```

### Problem

```
200 Records

↓

200 Updates

↓

Governor Limit Exceeded ❌
```

---

# ✅ Bulkified Design

```
Receive Records

↓

Collect IDs

↓

One SOQL Query

↓

Store Records in Map

↓

Validation

↓

Collect Updates

↓

One DML Statement
```

---

# 📚 Collections Used

## 📋 List

Stores multiple records.

```apex
List<Application__c> applications;
```

---

## 🎯 Set

Stores only unique values.

```apex
Set<Id> studentIds;
```

Duplicates are automatically removed.

---

## 🗺 Map

Stores Key → Value pairs.

```apex
Map<Id, Student__c> studentsById;
```

Provides fast record lookup.

---

# 🏗 Bulk Processing Pattern

```
📥 Receive Trigger Records

        │

        ▼

🆔 Collect IDs

        │

        ▼

🔍 Execute One SOQL Query

        │

        ▼

🗺 Store Results in Map

        │

        ▼

✅ Validate Records

        │

        ▼

📋 Collect Updates

        │

        ▼

💾 Execute One DML
```

---

# 💡 Best Practices

✅ Think in Collections

✅ Query Once

✅ Update Once

✅ Use Lists

✅ Use Sets

✅ Use Maps

✅ Keep SOQL Outside Loops

✅ Keep DML Outside Loops

✅ Bulkify Every Trigger

---

# 🎯 Interview Tips

### What is Bulkification?

Bulkification is the practice of writing Apex code that processes multiple records efficiently in one transaction.

---

### Why is SOQL inside loops dangerous?

Because it executes one query for every record and may exceed Salesforce Governor Limits.

---

### Why is DML inside loops dangerous?

Each DML operation counts individually and can exceed the DML statement limit.

---

### Which collection removes duplicate values?

✅ Set

---

### Which collection provides fast lookup?

✅ Map

---

# 🌟 Final Takeaway

> **"Think in Collections, Query Once, Update Once."**

This single principle is the foundation of scalable Salesforce Apex development.
