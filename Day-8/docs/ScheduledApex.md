# ⏰ Scheduled Apex in Salesforce

---

# 📌 Introduction

Scheduled Apex allows developers to execute Apex classes automatically at a specified date and time.

Instead of manually running a class, Salesforce schedules and executes it based on a CRON expression.

Scheduled Apex is commonly used for recurring business processes such as daily reports, data cleanup, notifications, and batch jobs.

---

# 🎯 Why Scheduled Apex?

Many business operations need to run automatically without user interaction.

Examples include:

- 📧 Sending daily email reports
- 🗑 Cleaning old records
- 📊 Running analytics every night
- 🔄 Synchronizing external systems
- 📅 Weekly and monthly maintenance jobs

Scheduled Apex helps automate these tasks.

---

# ⚙️ How Scheduled Apex Works

```
User Schedules Job

        │

        ▼

System.schedule()

        │

        ▼

Salesforce Scheduler

        │

        ▼

execute()

        │

        ▼

Task Completed
```

---

# 🏗 Schedulable Interface

Every Scheduled Apex class must implement:

```apex
Schedulable
```

---

# 🔹 execute()

The execute() method contains the logic that Salesforce runs according to the schedule.

Example:

```apex
global class ExpiredJobScheduler
implements Schedulable{

    global void execute(
        SchedulableContext sc){

        System.debug('Scheduled Job Started');

    }

}
```

---

# 🛠 Implementation

## ExpiredJobScheduler.cls

```apex
global class ExpiredJobScheduler
implements Schedulable {

    global void execute(
        SchedulableContext sc) {

        System.debug(
            'Scheduled Job Started'
        );

        Database.executeBatch(
            new PlacementAnalyticsBatch(),
            200
        );

        System.debug(
            'Scheduled Job Completed'
        );

    }

}
```

---

# ▶️ Scheduling the Job

Open:

```
Developer Console

↓

Debug

↓

Open Execute Anonymous
```

Run:

```apex
String cronExp = '0 0 12 * * ?';

System.schedule(
    'Placement Scheduler',
    cronExp,
    new ExpiredJobScheduler()
);
```

---

# 📖 Understanding the CRON Expression

Example:

```text
0 0 12 * * ?
```

Meaning:

| Value | Description |
|--------|-------------|
| 0 | Seconds |
| 0 | Minutes |
| 12 | Hour (12 PM) |
| * | Every Day of Month |
| * | Every Month |
| ? | No specific Day of Week |

---

# 📅 Scheduled Jobs

To verify scheduled jobs:

```
Setup

↓

Scheduled Jobs
```

This page displays:

- Job Name
- Owner
- Frequency
- Next Run Time
- Status

---

# 📊 Execution Flow

```
Schedule Created

        │

        ▼

Salesforce Scheduler

        │

        ▼

ExpiredJobScheduler

        │

        ▼

PlacementAnalyticsBatch

        │

        ▼

Completed
```

---

# 🌟 Advantages

- Automatic execution
- No manual intervention
- Supports recurring jobs
- Can execute Batch Apex
- Improves productivity
- Enterprise ready

---

# ⚠️ Limitations

- Uses Governor Limits
- Depends on CRON expressions
- Cannot execute continuously
- Scheduled jobs have platform limits

---

# 💡 Best Practices

✅ Schedule jobs during off-peak hours

✅ Use Batch Apex for large datasets

✅ Keep execute() lightweight

✅ Avoid unnecessary SOQL and DML

✅ Monitor Scheduled Jobs regularly

---

# 🌍 Real-World Use Cases

- Daily placement reports
- Student reminder emails
- Nightly analytics
- Weekly data cleanup
- Monthly archival jobs
- CRM synchronization

---

# 📸 Screenshots

Include:

- scheduled-apex-class.png
- scheduled-execute-anonymous.png
- scheduled-jobs.png

---

# 🎤 Interview Questions

## 1. What is Scheduled Apex?

Scheduled Apex executes Apex classes automatically at predefined times using CRON expressions.

---

## 2. Which interface is implemented?

```apex
Schedulable
```

---

## 3. Which method schedules a job?

```apex
System.schedule()
```

---

## 4. Which method is executed?

```apex
execute()
```

---

## 5. Can Scheduled Apex execute Batch Apex?

✅ Yes.

---

## 6. What is a CRON Expression?

A CRON expression defines the schedule for when a job should run automatically.

---

# 📚 Key Takeaways

✔ Automates recurring business processes.

✔ Uses the Schedulable interface.

✔ Executes based on CRON expressions.

✔ Can trigger Batch Apex jobs.

✔ Frequently used in enterprise Salesforce applications.

---

# 📝 Summary

Scheduled Apex enables Salesforce developers to automate recurring operations by executing Apex classes at specified times. Combined with Batch Apex, it forms a powerful solution for background processing, reporting, and maintenance tasks in enterprise applications.
