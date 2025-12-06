---
title : "AWS Cloud Mastery Series #3"
date: 2024-01-01T00:00:00+07:00 
weight : 3 
chapter : false
pre : " <b> 4.3. </b> "
---

{{% notice warning %}}
⚠️ **Note:** The information below is for reference purposes only. Please **do not copy verbatim** for your report, including this warning.
{{% /notice %}}

# AWS Cloud Mastery Series #3
## AWS Well-Architected Security Pillar

### Event Details

📅 **Saturday, November 29, 2025** *(Morning Only)*  
🕣 **8:30 AM – 12:00 PM**  
📍 **Bitexco Financial Tower**  
Quận 1, Thành phố Hồ Chí Minh

---

### Agenda

#### 8:30 – 8:50 AM | Opening & Security Foundation

- Role of Security Pillar in Well-Architected Framework
- Core principles: Least Privilege – Zero Trust – Defense in Depth
- Shared Responsibility Model
- Top threats in cloud environments in Vietnam

---

### ⭐ Pillar 1 — Identity & Access Management

#### 8:50 – 9:30 AM | Modern IAM Architecture

- **IAM:** Users, Roles, Policies – avoiding long-term credentials
- **IAM Identity Center:** SSO, permission sets
- **SCP & permission boundaries** for multi-account
- **MFA, credential rotation, Access Analyzer**
- **Mini Demo:** Validate IAM Policy + simulate access

---

### ⭐ Pillar 2 — Detection

#### 9:30 – 9:55 AM | Detection & Continuous Monitoring

- **CloudTrail** (org-level), **GuardDuty**, **Security Hub**
- Logging at every layer: VPC Flow Logs, ALB/S3 logs
- Alerting & automation with EventBridge
- Detection-as-Code (infrastructure + rules)

#### 9:55 – 10:10 AM | Coffee Break

---

### ⭐ Pillar 3 — Infrastructure Protection

#### 10:10 – 10:40 AM | Network & Workload Security

- **VPC segmentation**, private vs public placement
- **Security Groups vs NACLs:** application models
- **WAF + Shield + Network Firewall**
- **Workload protection:** EC2, ECS/EKS security basics

---

### ⭐ Pillar 4 — Data Protection

#### 10:40 – 11:10 AM | Encryption, Keys & Secrets

- **KMS:** key policies, grants, rotation
- **Encryption at-rest & in-transit:** S3, EBS, RDS, DynamoDB
- **Secrets Manager & Parameter Store** — rotation patterns
- Data classification & access guardrails

---

### ⭐ Pillar 5 — Incident Response

#### 11:10 – 11:40 AM | IR Playbook & Automation

- **IR lifecycle** according to AWS
- **Playbooks:**
  - Compromised IAM key
  - S3 public exposure
  - EC2 malware detection
- Snapshot, isolation, evidence collection
- Auto-response using Lambda/Step Functions

---

#### 11:40 – 12:00 PM | Wrap-Up & Q&A

- Summary of 5 pillars
- Common pitfalls & real-world scenarios in Vietnamese enterprises
- Security learning roadmap (Security Specialty, SA Pro)

---

### Key Takeaways

- Comprehensive understanding of AWS Well-Architected Security Pillar
- Hands-on IAM best practices and policy validation
- Detection and monitoring strategies with AWS security services
- Infrastructure and data protection implementation
- Incident response automation and playbooks
- Security certification pathways
