# 🔄 Day 9 — Data Flow Architecture

<p align="center">
  <strong>Student Placement Portal</strong><br>
  <em>Understanding how data travels across LWC, Apex, Services and Salesforce</em>
</p>

<p align="center">

![Salesforce](https://img.shields.io/badge/Salesforce-LWC-00A1E0?style=for-the-badge&logo=salesforce)
![Apex](https://img.shields.io/badge/Apex-Backend-1798C1?style=for-the-badge)
![Architecture](https://img.shields.io/badge/Architecture-Layered-6C63FF?style=for-the-badge)
![Status](https://img.shields.io/badge/Day%209-Completed-2EA44F?style=for-the-badge)

</p>

---

## 👩‍💻 Author

**SEERAM VIJAYA LAKSHMI**

B.Tech — Computer Science & Business Systems  
**Vishnu Institute of Technology**

**Salesforce Developer Bootcamp Participant**

> *Learn • Build • Test • Debug • Deploy • Document 🚀*

---

# 🧭 Data Flow at a Glance

The Student Placement Portal follows a **two-directional data flow**.

### 🔵 Read Flow

Salesforce data travels toward the user interface.

```text
Salesforce
    ↓
Apex / Wire Service
    ↓
LWC JavaScript
    ↓
Component State
    ↓
HTML Template
    ↓
User Interface
Component State
      ↓
LWC Template
      ↓
User Interface
