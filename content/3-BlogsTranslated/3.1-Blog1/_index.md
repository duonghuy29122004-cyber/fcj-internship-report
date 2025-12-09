---
title: "AWS CDK Launches Refactoring Feature"
date: "2024-01-01"
weight: 1
chapter: false
pre: " <b> 3.1 </b> "
---

## AWS Cloud Development Kit (CDK) Launches Refactoring Feature

We are excited to introduce a new AWS Cloud Development Kit (CDK) feature that makes refactoring infrastructure as code easier and safer. CDK Refactor aims to preserve AWS resources when you rename constructs, move resources between stacks, and reorganize CDK applications – operations that previously risked resource replacement.

### The Problem

When writing infrastructure as code with CDK, developers sometimes need to rename Constructs or move them between Stacks or directories. Whether they need to better organize code, follow coding best practices, or leverage object-oriented programming patterns like class inheritance, these changes can pose risks in environments with deployed resources, as they alter the logical IDs that CDK generates for those resources.

During CDK deployment, AWS CloudFormation interprets these changes as new resources, often requiring deletion of existing resources and creation of new resources with new logical IDs. For stateful resources, this can cause potential downtime and even data loss.

To mitigate the impact of these ID changes, developers must stage their changes to create new resources, create data or network migration plans, then delete old resources to prevent these refactoring impacts. Sometimes, developers decide that the risk of these changes outweighs the benefits of refactoring and choose not to refactor.

### The Solution

Today, developers can use the new CDK refactor command to detect, review, validate, and safely apply refactored changes to their resources without replacing resources. This feature leverages the recently launched AWS CloudFormation refactoring capability, but CDK automatically calculates the mappings that CloudFormation needs to reidentify refactored resources, providing an abstraction layer that allows developers to focus on code rather than resource configuration.

### Prerequisites

Along with the usual CDK prerequisites, if you bootstrapped your CDK project before this launch, you need to re-bootstrap your environment to get the new permissions related to CDK refactoring capability before attempting to refactor.

### Example: From Monolith to Microservices

In this example, suppose we have a legacy CDK application deploying a monolithic Stack with Amazon DynamoDB tables for users, products, and orders, along with a single AWS Lambda function implementing CRUD operations on all entities.

#### Initial Architecture (Monolith)
![Architecture](/images/blog1.png)
```javascript
function monolithApp() {
  const monolith = new CdkAppStack(app, monolithStackName, {env});
  
  const usersTable = makeTable(monolith, 'users');
  const productsTable = makeTable(monolith, 'products');
  const ordersTable = makeTable(monolith, 'orders');
  
  // We have a single Lambda function in our application
  const func = new Function(monolith, `MonolithFunction`, {
    code: Code.fromInline(`Some code that accesses all three tables`),
    runtime: Runtime.NODEJS_22_X,
    handler: 'index.handler',
  });
  
  usersTable.grantReadWriteData(func);
  productsTable.grantReadWriteData(func);
  ordersTable.grantReadWriteData(func);
  
  // This function creates a REST API, resources, methods, and links
  // everything together to the functions. Right now, we are passing
  // the same function in three places.
  makeApi(monolith, {
    usersFunction: func,
    productsFunction: func,
    ordersFunction: func,
  });
}

monolithApp();
```

#### Refactoring Requirements

We are asked to comply with Well Architected Framework best practices and split the monolith into separate Lambda functions so they can scale independently. Since they are very similar, we will also create an inheritable Lambda class that we can reuse to improve code readability and maintainability, while avoiding having to redefine uniform Lambda configuration settings across all functions.

Finally, the monolith only uses CDK L1 Constructs. To further abstract the code and leverage helper functions, we will start using CDK L2 Constructs for DynamoDB, Lambda, and API Gateway. This change will allow automatic definition of IAM Permissions and Roles, simplifying the code.

![Microservices Architecture](/images/blog1.2.png)

The proposed application is refactored into separate stacks for each domain. Without the refactoring feature, CloudFormation would delete and recreate resources, causing data loss.

### Replacing Stateless Resources

Refactor CDK code to split the monolithic Lambda into 3 separate Lambdas:

```javascript
function singleStackMicroservicesApp() {
  const monolith = new CdkAppStack(app, monolithStackName, {env});
  
  makeApi(monolith, {
    usersFunction: makeFunctionAndTable(monolith, 'users'),
    productsFunction: makeFunctionAndTable(monolith, 'products'),
    ordersFunction: makeFunctionAndTable(monolith, 'orders'),
  });
}
```

### Refactoring Stateful Resources

Create new stacks and move resources:

```javascript
function fullMicroservicesApp() {
  const monolith = new Stack(app, monolithStackName, {env});
  const usersStack = new Stack(app, 'Users', {env});
  const productsStack = new Stack(app, 'Products', {env});
  const ordersStack = new Stack(app, 'Orders', {env});
  
  makeApi(monolith, {
    usersFunction: makeFunctionAndTable(usersStack, 'users'),
    productsFunction: makeFunctionAndTable(productsStack, 'products'),
    ordersFunction: makeFunctionAndTable(ordersStack, 'orders'),
  });
}
```

Run `cdk refactor --unstable=refactor` to safely move resources without data loss.

### Conclusion

The CDK Refactor feature allows developers to confidently refactor infrastructure code, preserve AWS resources, and minimize risk. Read more in the CDK Refactor documentation to get started!

---

**Source:** AWS Blog  
**Date:** September 10, 2025  
**Translated by:** Duong Nguyen Gia Huy
