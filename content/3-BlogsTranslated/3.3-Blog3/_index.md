---
title: "Securing VIN with Reference ID on AWS IoT"
date: "2024-01-01"
weight: 3
chapter: false
pre: " <b> 3.3 </b> "
---

## Securing Vehicle Identification Number (VIN) with Reference ID in Connected Vehicle Platform on AWS IoT

### Introduction

With over 470 million connected cars expected by the end of 2025, protecting sensitive vehicle data, especially Vehicle Identification Numbers (VIN), has become critically important for automotive manufacturers. VINs serve as unique identifiers throughout automotive processes, from manufacturing to maintenance, making them attractive targets for cybercriminals.
![Architecture](/images/blog3.png)
### The Problem

VINs contain critical vehicle information (manufacturer, model, year) and can be linked to personal data. Unprotected VINs in cloud environments risk:

- Identity theft
- Vehicle theft
- Insurance fraud
- Privacy violations
- Regulatory non-compliance (GDPR, CCPA)

### Solution: Reference ID

This solution introduces **Reference ID** as a pseudonym for VIN, enabling secure vehicle data interaction without exposing actual VINs.

#### How It Works

The system uses Reference ID, where each vehicle receives a unique identifier (UUID) during provisioning, acting as a VIN proxy in all platform interactions. The vehicle registry database stores both hashed and encrypted versions of the VIN, mapped to the Reference ID.

VINs are encrypted using AWS Key Management Service (KMS) as a safeguard. When plain-text VIN retrieval is needed, this value can be decrypted, ensuring the actual VIN is only accessible when truly necessary.

#### Benefits

- Acts as VIN proxy, enhancing security and data minimization
- Supports compliance with data protection regulations
- Provides flexible access control
- Improved auditability
- Scalability for large fleets
- Easier system interoperability
- Enables revocation without changing underlying VIN

## System Architecture

### 1. Reference ID

Reference ID is a UUID generated during vehicle provisioning, serving as a VIN proxy throughout the vehicle's lifecycle, creating an abstraction layer protecting sensitive VIN data.

### 2. Vehicle Registry Database

The vehicle registry database serves as a centralized repository for vehicle information. Key features:

- Reference ID to hashed VIN mapping
- Encrypted VIN storage
- Vehicle provisioning and state change tracking
- Device change history
- Vehicle attributes and configuration

**Database Structure:**
- `referenceId` – Partition key
- `deviceId` – Global secondary index
- `hashedVin` – Global secondary index
- `tenantId`
- `encryptedVin`

### 3. Vehicle Provisioning Process

#### 3.1 Data Validation
1. Provisioning infrastructure hashes VIN and queries database for first-time provisioning check
2. For new vehicles, DEVICE_ID validated based on TCU manufacturer data
3. Checks if DEVICE_ID already attached to another vehicle

#### 3.2 Reference ID Generation
1. Query database to validate if vehicle already provisioned
2. If not, generate new UUID as Reference ID
3. Store Reference ID, hashed VIN, and encrypted VIN (via KMS)
4. Ensure UUID uniqueness

#### 3.3 Certificate Generation
- Certificate generated using ACM PCA with Common Name = Reference ID

#### 3.4 AWS IoT Integration
1. Create AWS IoT Thing with Thing Name = Reference ID
2. Create AWS IoT FleetWise Vehicle with Vehicle Name = Reference ID

#### 3.5 Response
- Vehicle receives Certificate and Reference ID
- Vehicle connects to AWS IoT FleetWise using certificate and ClientId = ReferenceID

### 4. Data Collection and Storage

#### 4.1 Vehicle to AWS IoT FleetWise
- Vehicle connects using Reference ID as Client ID
- All data associated with Reference ID

#### 4.2 AWS IoT FleetWise to Data Platform
- Data enriched with Vehicle Name (Reference ID)

#### 4.3 Storage and Retrieval
- Data stored with Reference ID as identifier
- Mobile app queries via API Platform using Reference ID

### 5. Customer Application Interaction

#### 5.1 VIN to Reference ID Conversion
1. After ownership verification, client app calls API for conversion
2. API queries database to retrieve corresponding Reference ID
3. Reference ID returned to application

**Security Considerations:**
- Strict access control via authentication and authorization
- Log all conversion requests
- Rate limiting and DoS/DDoS protection
- Limit access to authorized applications

#### 5.2 Using Reference ID
After obtaining Reference ID, application can:
1. Retrieve data from data platform
2. Perform direct vehicle operations (remote commands)

### 6. Telematics Control Unit (TCU) Change

#### 6.1 Update TCU
**Input:** Hashed VIN (or Reference ID), current DEVICE_ID, new DEVICE_ID

**Process:**
1. Verify hashed VIN and current DEVICE_ID
2. Check new DEVICE_ID not linked to another vehicle
3. Update DEVICE_ID in database
4. Revoke and delete current certificate
5. New TCU undergoes provisioning process

#### 6.2 Remove TCU
**Input:** Hashed VIN (or Reference ID), current DEVICE_ID

**Process:**
1. Verify hashed VIN and DEVICE_ID
2. Remove DEVICE_ID from database
3. Revoke and delete certificate

## Security and Performance Considerations

### Security
- Minimizes VIN exposure risk in daily operations
- Only stores hashed and encrypted VINs
- AWS KMS encryption
- Strict access control policies

### Performance and Scalability
- Efficient UUID generation technology
- DynamoDB Global Secondary Indexes for fast queries
- Scalability for large fleets

### Future
- Blockchain or distributed ledger integration
- Advanced analytics and machine learning
- Continuous GDPR and CCPA compliance

## Conclusion

The Reference ID system helps automotive manufacturers enhance VIN security in connected vehicle platforms on AWS. This architecture:

- Protects sensitive vehicle data
- Maintains full functionality
- Scales efficiently
- Meets compliance standards
- Provides flexible framework for vehicle identity management

As connected vehicle numbers continue to grow, robust security measures become critically important. This system not only protects VINs but also helps meet data protection requirements.

You should explore how to apply this approach to your connected vehicle solutions. For more information about AWS IoT services and connected vehicle best practices, visit the AWS IoT FleetWise documentation and related blog posts.

---

**Source:** AWS Blog  
**Date:** September 10, 2025  
**Translated by:** Duong Nguyen Gia Huy
