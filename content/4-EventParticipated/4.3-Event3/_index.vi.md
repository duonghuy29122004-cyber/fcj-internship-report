---
title : "AWS Cloud Mastery Series #3"
date: 2024-01-01T00:00:00+07:00 
weight : 3 
chapter : false
pre : " <b> 4.3. </b> "
---

{{% notice warning %}}
⚠️ **Lưu ý:** Các thông tin dưới đây chỉ nhằm mục đích tham khảo, vui lòng **không sao chép nguyên văn** cho bài báo cáo của bạn kể cả warning này.
{{% /notice %}}

# AWS Cloud Mastery Series #3
## Theo AWS Well-Architected Security Pillar

### Thông tin Sự kiện

📅 **Thứ Bảy, 29 tháng 11, 2025** *(Chỉ buổi sáng)*  
🕣 **8:30 AM – 12:00 PM**  
📍 **Bitexco Financial Tower**  
Quận 1, Thành phố Hồ Chí Minh

---

### Chương trình

#### 8:30 – 8:50 AM | Khai mạc & Nền tảng Bảo mật

- Vai trò Security Pillar trong Well-Architected Framework
- Nguyên tắc cốt lõi: Least Privilege – Zero Trust – Defense in Depth
- Shared Responsibility Model
- Top threats trong môi trường cloud tại Việt Nam

---

### ⭐ Pillar 1 — Identity & Access Management

#### 8:50 – 9:30 AM | Kiến trúc IAM Hiện đại

- **IAM:** Users, Roles, Policies – tránh long-term credentials
- **IAM Identity Center:** SSO, permission sets
- **SCP & permission boundaries** cho multi-account
- **MFA, credential rotation, Access Analyzer**
- **Mini Demo:** Validate IAM Policy + simulate access

---

### ⭐ Pillar 2 — Detection

#### 9:30 – 9:55 AM | Detection & Continuous Monitoring

- **CloudTrail** (org-level), **GuardDuty**, **Security Hub**
- Logging tại mọi tầng: VPC Flow Logs, ALB/S3 logs
- Alerting & automation với EventBridge
- Detection-as-Code (infrastructure + rules)

#### 9:55 – 10:10 AM | Giải lao

---

### ⭐ Pillar 3 — Infrastructure Protection

#### 10:10 – 10:40 AM | Network & Workload Security

- **VPC segmentation**, private vs public placement
- **Security Groups vs NACLs:** mô hình áp dụng
- **WAF + Shield + Network Firewall**
- **Workload protection:** EC2, ECS/EKS security basics

---

### ⭐ Pillar 4 — Data Protection

#### 10:40 – 11:10 AM | Encryption, Keys & Secrets

- **KMS:** key policies, grants, rotation
- **Encryption at-rest & in-transit:** S3, EBS, RDS, DynamoDB
- **Secrets Manager & Parameter Store** — patterns rotation
- Data classification & access guardrails

---

### ⭐ Pillar 5 — Incident Response

#### 11:10 – 11:40 AM | IR Playbook & Automation

- **IR lifecycle** theo AWS
- **Playbook:**
  - Compromised IAM key
  - S3 public exposure
  - EC2 malware detection
- Snapshot, isolation, evidence collection
- Auto-response bằng Lambda/Step Functions

---

#### 11:40 – 12:00 PM | Tổng kết & Q&A

- Tổng kết 5 pillars
- Common pitfalls & thực tế doanh nghiệp Việt Nam
- Roadmap security learning (Security Specialty, SA Pro)

---

### Kiến thức Thu được

- Hiểu biết toàn diện về AWS Well-Architected Security Pillar
- Best practices IAM thực hành và policy validation
- Chiến lược detection và monitoring với AWS security services
- Triển khai bảo vệ infrastructure và data
- Tự động hóa incident response và playbooks
- Lộ trình chứng chỉ Security
