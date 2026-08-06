
# 📚 Collections in Apex

Collections allow developers to efficiently manage and process multiple records at once. They are the foundation of **Bulkification**.

Salesforce provides three main collection types:

- 📋 List
- 🎯 Set
- 🗺️ Map

---

# 📋 List

A **List** stores multiple records while maintaining the insertion order.

### Features

- Stores duplicate values
- Ordered collection
- Access elements using index
- Most commonly used collection in Apex

### Example

```apex
List<String> cities = new List<String>{
    'Hyderabad',
    'Chennai',
    'Delhi'
};

System.debug(cities);
```

### Output

```
(Hyderabad, Chennai, Delhi)
```

### Use Cases

- Store multiple records
- Display records
- Process Trigger.new
- Perform Bulk DML operations

---

# 🎯 Set

A **Set** stores only unique values.

### Features

- No duplicate values
- Unordered collection
- Faster searching than List
- Commonly used to collect unique IDs

### Example

```apex
Set<String> skills = new Set<String>();

skills.add('Apex');
skills.add('SOQL');
skills.add('Apex');

System.debug(skills);
```

### Output

```
(Apex, SOQL)
```

Notice that **Apex** appears only once because Sets automatically remove duplicates.

### Use Cases

- Collect unique Student IDs
- Collect unique Job IDs
- Remove duplicate values
- Prepare IDs for SOQL queries

---

# 🗺️ Map

A **Map** stores data as **Key → Value** pairs.

### Features

- Every key must be unique
- Fast record retrieval
- Efficient lookup by ID
- Essential for Bulkification

### Example

```apex
Map<Integer, String> numbers = new Map<Integer, String>();

numbers.put(1, 'One');
numbers.put(2, 'Two');

System.debug(numbers);
```

### Output

```
{1=One, 2=Two}
```

### Salesforce Example

```apex
Map<Id, Student__c> studentsById;
```

This allows developers to retrieve a Student record quickly using its Id without executing another SOQL query.

---

# 🔄 Trigger Collections

Salesforce automatically provides collections inside Apex Triggers.

These collections help developers process multiple records efficiently.

---

## Trigger.new

Contains the new versions of records being inserted or updated.

```apex
for(Application__c app : Trigger.new){

    System.debug(app.Name);

}
```

---

## Trigger.old

Contains the old versions of records before an update or delete operation.

Useful for comparing previous values.

---

## Trigger.newMap

Stores new records in a **Map<Id, SObject>**.

Example:

```apex
Application__c app = Trigger.newMap.get(recordId);
```

---

## Trigger.oldMap

Stores previous versions of records in a Map.

Useful for comparing changes.

Example

```apex
Application__c oldApp = Trigger.oldMap.get(recordId);
```

---

# 🎯 Interview Tips

✅ Use **List** when processing multiple records.

✅ Use **Set** when duplicate values must be removed.

✅ Use **Map** for fast record lookup.

✅ Never execute SOQL inside loops.

✅ Never perform DML inside loops.

✅ Always process Trigger collections instead of individual records.

---

# 💡 Summary

| Collection | Purpose | Allows Duplicates |
|------------|---------|------------------|
| 📋 List | Store multiple records | ✅ Yes |
| 🎯 Set | Store unique values | ❌ No |
| 🗺️ Map | Store Key → Value pairs | Keys must be unique |

---

## 🌟 Key Takeaway

Mastering **Lists**, **Sets**, **Maps**, and **Trigger Collections** is essential for writing scalable, efficient, and governor-limit-safe Apex code.
