---
title: "Modern Observability Frameworks for SAP"
date: "2024-01-01"
weight: 2
chapter: false
pre: " <b> 3.2 </b> "
---

## Modern Observability Frameworks for SAP: Solutions for Monitoring Challenges with PowerConnect and Dynatrace

*This post was co-authored with Dynatrace and SoftwareOne PowerConnect. We sincerely thank Krzysztof Ziemianowicz, Director of Extension Services at Dynatrace, and Stephen Bangs, SAP Solutions Architect at SoftwareOne PowerConnect, for their contributions and support.*

### The Challenge

Modern SAP environments require sophisticated monitoring capabilities as business processes extend beyond the scope of individual systems. Organizations are now managing interconnected platforms, including:

- SAP Cloud ERP
- SAP Business Technology Platform (BTP)
- AWS services
- Multiple other cloud solutions

This complexity demands a new approach to system monitoring. Traditional monitoring tools, designed for single-system metrics and reactive alerts, no longer meet the needs of today's integrated business processes. Modern operations require comprehensive visibility across all connected systems to maintain optimal performance.

### The Solution: PowerConnect and Dynatrace

SoftwareOne PowerConnect for SAP Solutions addresses these challenges by providing comprehensive coverage across the SAP ecosystem. Its observability framework transforms system-specific monitoring operations into actionable intelligence through OpenTelemetry standards, enabling proactive performance management and providing real-time operational insights.

By combining PowerConnect's deep SAP expertise with Dynatrace's AI-powered platform, organizations achieve:

- **Comprehensive system visibility**
- **Proactive issue detection**
- **Automated root cause analysis**
- **Improved business outcomes**

This integrated approach provides comprehensive process visibility, helping organizations prevent disruptions and optimize operations across the entire SAP landscape.

### Enhancing SAP Visibility

PowerConnect collects observability signals from SAP Cloud ERP, SAP BTP, and SAP SaaS, then records them in the Dynatrace Grail data store. This is where organizations can maintain all AWS observability signals under a unified analytics model – exactly as you view your entire IT environment as a unified entity.

Dynatrace is part of the AWS Agentic AI Marketplace, and Dynatrace solutions can now be pre-integrated with AWS AI services, such as:
- Amazon Q
- Amazon Bedrock
- Amazon SageMaker

This collaboration enables businesses to extract deeper insights and confidently drive digital transformation.

### Platform Capabilities

The AI-powered Dynatrace observability platform transforms telemetry data into actionable intelligence through:

- Sophisticated AI/ML-powered pattern detection
- Automated analysis
- Pre-built dashboards
- Visual visualization of complex SAP environments
- Rapid identification of performance issues
- Discovery of optimization opportunities

The platform's comprehensive AI-powered contextual intelligence ensures organizations can track transactions and understand dependencies across their entire technology stack.
![Architecture](/images/blog2.png)

### PowerConnect Installation

PowerConnect installation for SAP solutions is supported across all SAP systems in SAP Cloud ERP private. Installation steps:

1. **Submit request to SAP Enterprise Cloud Services (ECS)** to install PowerConnect ABAP (including SAP S/4HANA) and if needed, install PowerConnect Java (including SAP Process Orchestration and SAP BusinessObjects)

2. **Submit request to SAP ECS** to allow Dynatrace tenant URL from proxy server in SAP managed account

3. **Install PowerConnect for SAP** on Dynatrace application from Dynatrace Hub

4. **Visualize and analyze** SAP signals using Dynatrace dashboards when data begins streaming

### Use Cases

After configuration, organizations can leverage pre-built dashboards for use cases:

- Background and batch jobs
- ABAP dumps and runtime errors
- Security audit log and application log analysis
- Workflows, locks, and update requests
- Transactional RFC and queued RFC transactions
- IDoc status, IDoc segments, and outbound distribution monitoring
![Architecture](/images/blog2.1.png)
There are over **200 pre-designed dashboards** in the PowerConnect for SAP on Dynatrace application, and organizations can build their own custom dashboards.

### Advanced Features

**Distributed Tracing application** centralizes and analyzes SAP traces collected by PowerConnect across multiple systems.

**Business Flow application** maps and evaluates SAP process execution and business events.

### A Single Solution for All SAP Environments

The standard integration architecture supports SAP cloud solutions, including:
- SAP BTP
- SAP Integration Suite
- SAP SuccessFactors
- SAP Ariba
- SAP Fieldglass
![Architecture](/images/blog2.2.png)
#### Deployment

This architectural model is deployed as follows:

1. **Provision Amazon EC2:** Organizations provision Amazon EC2 instances on AWS to host the PowerConnect Cloud standalone agent

2. **High Availability:** The agent can be installed on one EC2 instance or two EC2 instances to provide high availability

3. **API Connection:** The Amazon EC2 instance connects to SAP APIs and extracts signals forwarded to Dynatrace

4. **Installation Documentation:** PowerConnect Cloud installation steps on Amazon EC2 are provided in the installation documentation

5. **Connectivity:** The EC2 instance needs to connect to:
   - SAP BTP platform
   - SAP SaaS applications
   - Dynatrace tenant

6. **Cloud Foundry Option:** PowerConnect Cloud can be installed in SAP BTP Cloud Foundry environment using Cloud Foundry command-line tools

#### Role-based Dashboards
![Dashboard](/images/blog2.3.png)
Dynatrace provides a single data source that can instantly display necessary data in role-based dashboards, such as:
- SAP CPI message monitoring
- SAP BTP syslog insights

### Conclusion

The integration of Dynatrace and PowerConnect on AWS delivers this modern observability framework, moving beyond traditional single-system approaches to provide the comprehensive visibility and AI-driven insights necessary for today's connected SAP environments.

#### Key Benefits

By leveraging:
- AWS's scalable infrastructure
- Native AI service integration through AWS Agentic AI Marketplace
- Seamless marketplace deployment options

Organizations can rapidly deploy this solution to transform their SAP monitoring capabilities.

#### Business Value

The combination of Dynatrace and PowerConnect on AWS delivers tangible business value as organizations:
- Gain real-time insights into critical business processes
- Identify bottlenecks
- Optimize workflows
- Enhance user experience across their entire SAP landscape

#### Availability

Dynatrace Platform and PowerConnect for SAP Solutions are now available on AWS Marketplace.

---

**Source:** AWS Blog  
**Authors:** Abhik Ray and Bharat Ramaka  
**Date:** September 9, 2025  
**Translated by:** Duong Nguyen Gia Huy

*Dynatrace, Grail, and the Dynatrace logo are trademarks of Dynatrace, Inc.*
