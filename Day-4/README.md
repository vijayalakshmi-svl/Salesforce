# 🚀 Salesforce Interview Readiness Bootcamp – Day 4
# 🌟 Your First Lightning Web Component (LWC)

> **Bootcamp Module:** Day 4 – Lightning Web Components (LWC)  
> **Project:** Placement Management System – UI Development  
> **Technology:** Salesforce Lightning Web Components (LWC)

---

# 📖 Project Overview

This project marks the beginning of frontend development in the Salesforce ecosystem using **Lightning Web Components (LWC)**.

In the previous bootcamp sessions, the focus was on backend development, including data modeling, SOQL, Apex, and automation. In this module, the objective was to build the **first user interface** that serves as the entry point for the Placement Management System.

The component demonstrates how Salesforce combines **HTML, JavaScript, and XML metadata** to create fast, reusable, and interactive web components.

---

# 🎯 Learning Objectives

Throughout this project, the following concepts were implemented:

- ✅ Introduction to Lightning Web Components (LWC)
- ✅ Creating a custom Lightning Web Component
- ✅ Understanding the structure of an LWC
- ✅ Deploying components using Lightning App Builder
- ✅ Implementing reactive data binding
- ✅ Handling button click events
- ✅ Managing component state using JavaScript
- ✅ Building a basic Placement Dashboard UI

---

# 🏗️ Salesforce Architecture

```text
             USER
               │
               ▼
 Lightning Web Component (LWC)
               │
               ▼
         Apex Classes
               │
               ▼
             SOQL
               │
               ▼
      Salesforce Database
```

> **Note:**  
> This project focuses only on the **User Interface Layer**. Database connectivity using Apex and SOQL will be implemented in upcoming bootcamp sessions.

---

# 🛠️ Technologies Used

| Technology | Purpose |
|------------|---------|
| Salesforce Platform | CRM Development |
| Lightning Web Components | Frontend UI Framework |
| HTML | User Interface |
| JavaScript | Component Logic |
| XML | Component Configuration |
| Lightning App Builder | Component Deployment |

---

# 📂 Project Structure

```text
force-app/
└── main/
    └── default/
        └── lwc/
            └── placementHome/
                ├── placementHome.html
                ├── placementHome.js
                ├── placementHome.js-meta.xml
```

---

# 📄 Component Structure

## 📌 placementHome.html

Responsible for:

- UI Layout
- Text Rendering
- Buttons
- Dashboard Display
- Data Binding

---

## 📌 placementHome.js

Responsible for:

- Variables
- JavaScript Logic
- Event Handling
- Button Actions
- Status Updates

---

## 📌 placementHome.js-meta.xml

Responsible for:

- Exposing the component
- Lightning App Builder Configuration
- Defining supported targets

---

# ✨ Features Implemented

## 🏠 Welcome Screen

Displays

```text
Welcome to Vishnu Placement Portal
```

---

## 👨‍🎓 Student Information

Displays

```text
Student Name : Kommula Durga Aravind
Roll Number  : 23PA1A0484
Department   : ECE
```

Demonstrates **Reactive Data Binding** using JavaScript variables.

---

## 🎉 Welcome Message Button

Button

```text
Show Welcome Message
```

Output

```text
Welcome to Salesforce Development.
```

Demonstrates

- Event Handling
- JavaScript Methods
- UI Updates

---

## 📄 Application Status

Initial Status

```text
Not Applied
```

After Clicking Apply

```text
Applied
```

Demonstrates

- Dynamic UI Updates
- State Management

---

## 📊 Placement Dashboard

Displays

```text
Placement Portal

Today's Date

Welcome Student

Number of Companies : 25

Number of Jobs : 63

Applications Submitted : 5
```

This dashboard currently uses **hardcoded values** and will later be integrated with Apex and SOQL.

---

# 🔄 Data Binding Example

```html
<p>Hello {studentName}</p>
```

When the value of `studentName` changes inside the JavaScript file, the UI automatically updates.

This is known as **Reactive Data Binding**.

---

# 🧠 Concepts Learned

- Lightning Web Components Architecture
- Component-Based Development
- HTML Templates
- JavaScript Event Handling
- Reactive Properties
- Data Binding
- Component Deployment
- Lightning App Builder
- Separation of UI and Business Logic

---

# ❓ Interview Questions Covered

- What is Lightning Web Components?
- Why did Salesforce introduce LWC?
- Difference between LWC and Aura Components.
- Explain the three files inside an LWC.
- Why is JavaScript required?
- What is Data Binding?
- Can LWC directly execute SOQL?
- Why does LWC require Apex?
- Where can an LWC be deployed?
- Explain the component developed in this project.

---

# 📝 README Questions

## 1️⃣ What is Lightning Web Components (LWC)?

Lightning Web Components (LWC) is Salesforce's modern user interface framework built on web standards such as **HTML, JavaScript, and CSS**. It enables developers to create **fast, reusable, secure, and maintainable** web components that seamlessly integrate with Salesforce data through Apex.

---

## 2️⃣ What did you build?

I developed my first Lightning Web Component named **placementHome**.

The component includes:

- Welcome Page
- Student Details
- Welcome Button
- Application Status
- Placement Dashboard

The project demonstrates the fundamentals of **LWC development**, **data binding**, and **JavaScript event handling**.

---

## 3️⃣ Which file contains HTML?

```text
placementHome.html
```

Responsible for

- UI Design
- Layout
- Text
- Buttons
- Data Display

---

## 4️⃣ Which file contains JavaScript?

```text
placementHome.js
```

Responsible for

- Variables
- Logic
- Event Handling
- State Management

---

## 5️⃣ What did you learn today?

Through this project, I learned:

- Creating Lightning Web Components
- Understanding component architecture
- Working with HTML, JavaScript, and XML
- Implementing data binding
- Handling button click events
- Deploying components to Lightning App Builder
- Understanding how LWC communicates with Apex in enterprise Salesforce applications

---

# 🎯 Key Takeaway

Lightning Web Components (LWC) is Salesforce's modern frontend framework built on open web standards. It enables developers to create **fast, lightweight, reusable, and scalable user interfaces**, making Salesforce application development more efficient and maintainable.

---

# 🚀 Future Enhancements

In upcoming bootcamp sessions, this component will be integrated with:

- 🔹 Apex Classes
- 🔹 SOQL Queries
- 🔹 Salesforce Database
- 🔹 Dynamic Company Listings
- 🔹 Student Registration
- 🔹 Placement Application Tracking
- 🔹 Real-Time Dashboard
- 🔹 Authentication & Authorization

---

# 📌 Project Status

✅ Day 4 Successfully Completed

**Next Module:** Connecting Lightning Web Components with Apex Controllers and Salesforce Database.

---

# 👨‍💻 Author

**SEERAM VIJAYA LAKSHMI**

Salesforce Interview Readiness Bootcamp  
Day 4 – Lightning Web Components (LWC)

---

⭐ *This project is part of the Salesforce Interview Readiness Bootcamp and demonstrates the foundational concepts of Lightning Web Components (LWC) for building modern Salesforce user interfaces.*
