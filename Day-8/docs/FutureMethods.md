# 🚀 Future Methods in Salesforce Apex

---

# 📌 Introduction

Future Methods are one of Salesforce's asynchronous Apex features.

Instead of executing immediately, Future Methods are placed in a queue and processed later by the Salesforce platform.

This helps improve application performance and prevents long-running tasks from blocking user requests.

---

# 🎯 Why Use Future Methods?

Future Methods are useful when an operation does not need to complete immediately.

Common use cases include:

- 📧 Sending Emails
- 🌐 Making HTTP Callouts
- 🔄 Updating Records After Transactions
- 📊 Background Processing
- 🔗 Integration with External Systems

---

# ⚙️ Syntax

```apex
@future
public static void methodName(){

}
```

---

# 📖 Rules of Future Methods

✔ Must be **static**

✔ Must return **void**

✔ Cannot return values

✔ Can accept only primitive data types or collections of primitive types

✔ Cannot accept sObjects directly

✔ Runs asynchronously

---

# 🛠 Implementation

### ApplicationFutureService.cls

```apex
public class ApplicationFutureService {

    @future
    public static void sendNotification(Id applicationId){

        System.debug('Future Method Started');

        System.debug('Application Id: ' + applicationId);

        // Future business logic goes here

        System.debug('Future Method Completed');

    }

}
```

---

# ▶️ Executing the Future Method

Open:

```
Developer Console

↓

Debug

↓

Open Execute Anonymous
```

Execute:

```apex
ApplicationFutureService.sendNotification(
    '001000000000001AAA'
);
```

---

# 📋 Expected Debug Log

```
Future Method Started

Application Id: 001000000000001AAA

Future Method Completed
```

---

# 📈 Execution Flow

```
User Action

        │

        ▼

Future Method Called

        │

        ▼

Placed into Queue

        │

        ▼

Salesforce Executes

        │

        ▼

Background Processing Completed
```

---

# 🌟 Advantages

- Improves User Experience
- Executes in Background
- Better Performance
- Supports Callouts
- Reduces Waiting Time

---

# ⚠️ Limitations

- No Return Values
- Static Methods Only
- Cannot Chain Future Methods
- Cannot Monitor Job Easily
- Limited Parameter Types

---

# 💡 Best Practices

✅ Use for lightweight tasks

✅ Use Queueable Apex for complex logic

✅ Keep Future Methods short

✅ Avoid unnecessary SOQL and DML

✅ Handle exceptions properly

---

# 🔍 Real-World Examples

- Sending confirmation emails
- Calling payment gateways
- Updating external ERP systems
- Logging audit information
- Processing notifications

---

# 📸 Screenshots

Include the following screenshots:

- future-method-class.png
- future-execute-anonymous.png
- future-debug-log.png

---

# 🎤 Interview Questions

### 1. What is a Future Method?

A Future Method is an asynchronous Apex method that runs in the background after the current transaction completes.

---

### 2. Why are Future Methods used?

To execute long-running or non-critical operations asynchronously without delaying the user's request.

---

### 3. What are the limitations of Future Methods?

- Static only
- Void return type
- No sObject parameters
- No job chaining

---

### 4. Can Future Methods call another Future Method?

❌ No.

---

### 5. Which annotation is used?

```apex
@future
```

---

# 📝 Summary

Future Methods are ideal for lightweight asynchronous processing. They improve performance by executing tasks in the background, making them suitable for email sending, integrations, and simple background operations.
