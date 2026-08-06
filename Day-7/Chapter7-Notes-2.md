

# 🔍 Why is SOQL Inside Loops Dangerous?

One of the biggest mistakes beginners make is executing a SOQL query inside a loop.

### ❌ Bad Example

```apex
for(Application__c app : Trigger.new){

    Student__c student = [
        SELECT Id, Name
        FROM Student__c
        WHERE Id = :app.Student__c
    ];

}
```

### 🚨 What Happens?

Suppose the trigger receives:

```
200 Applications

↓

200 SOQL Queries

↓

Governor Limit Exceeded ❌
```

Salesforce allows only **100 SOQL Queries** per transaction.

Processing 200 records would execute 200 queries, causing:

```
Too many SOQL queries: 101
```

---

# 💡 Best Practice

Always collect record IDs first, then execute **one SOQL query** outside the loop.

```
Collect IDs

↓

One SOQL Query

↓

Store Results in Map

↓

Process Records
```

---

# ⚠️ Why is DML Inside Loops Dangerous?

Another common mistake is performing DML operations inside loops.

### ❌ Bad Example

```apex
for(Application__c app : applications){

    update app;

}
```

### 🚨 What Happens?

```
200 Applications

↓

200 Update Statements

↓

Governor Limit Exceeded ❌
```

Salesforce allows only **150 DML statements** per transaction.

---

# ✅ Correct Approach

Store all records in a list and perform **one update**.

```apex
List<Application__c> updates = new List<Application__c>();

for(Application__c app : applications){

    updates.add(app);

}

update updates;
```

✔ Only **one DML statement** is executed.

---

# 🚀 What is Bulkification?

Bulkification is the process of writing Apex code that efficiently handles **multiple records** in a single transaction.

Instead of processing one record at a time, Salesforce processes collections of records together.

### 📊 Bulkification Workflow

```
📥 Receive Records
        │
        ▼
🆔 Collect IDs
        │
        ▼
🔍 One SOQL Query
        │
        ▼
🗺 Store in Map
        │
        ▼
✅ Validate Records
        │
        ▼
📋 Collect Updates
        │
        ▼
💾 One DML Operation
```

---

# 🎯 Advantages of Bulkification

- ⚡ Improves Performance
- 🚀 Faster Execution
- 📉 Reduces SOQL Queries
- 📉 Reduces DML Statements
- 🔒 Prevents Governor Limit Exceptions
- 💼 Follows Salesforce Best Practices
- 📈 Supports Large Data Volumes

---

# 📝 Key Takeaways

> 🚀 Never place **SOQL queries** inside loops.

> 🚀 Never perform **DML operations** inside loops.

> 🚀 Always process **collections of records** instead of individual records.

> 🚀 Bulkification is one of the most important concepts for every Salesforce Developer.
