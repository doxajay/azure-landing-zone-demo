# Azure Client Onboarding Landing Zone – Architecture Overview

## 1. Purpose
This architecture provides a standardized, secure, and repeatable foundation for onboarding internal clients or environments into Azure.  
The objective is to reduce operational risk, enforce enterprise standards, and enable consistent cloud deployments using Infrastructure as Code.

This design reflects how platform and infrastructure teams support multiple business units on a shared cloud foundation.

---

## 2. High-Level Architecture

### Hub-and-Spoke Network Model
The landing zone uses a hub-and-spoke topology:

- **Hub VNet**
  - Central connectivity layer
  - Shared services (future: firewall, DNS, monitoring)
  - Acts as the control point for traffic inspection and routing

- **Spoke VNets**
  - Dedicated per client or workload
  - Isolated address spaces
  - Peered to the hub with controlled routing

This model limits blast radius, improves security, and scales cleanly as more clients are onboarded.

---

## 3. Network Segmentation & Security

### Segmentation Strategy
- Separate VNets for hub and spokes
- Dedicated subnets per workload tier
- Network Security Groups (NSGs) applied at subnet level

### Why Segmentation Matters
- Reduces lateral movement risk
- Enforces least-privilege network access
- Enables future insertion of firewalls and private endpoints
- Aligns with enterprise security and compliance expectations

---

## 4. Identity & Access (Conceptual)
- Azure access is delegated through non-human identities (service principals)
- Role-Based Access Control (RBAC) is scoped at the subscription level
- Separation of duties between:
  - Platform administrators
  - Application teams
  - Operations / support

This ensures automation is secure and auditable.

---

## 5. Monitoring & Observability

- Centralized Log Analytics workspace
- Designed as a shared monitoring foundation
- Supports future diagnostics policies and alerting standards

Central logging enables:
- Faster incident investigation
- Consistent operational visibility
- Easier handover to operations teams

---

## 6. Infrastructure as Code & Governance

- Terraform defines all infrastructure
- GitHub is the source of truth
- Terraform Cloud manages:
  - State
  - Execution
  - Run history and audit trail

This eliminates ad-hoc portal changes and configuration drift.

---

## 7. Client Onboarding Model (Example)

### Client A (Finance System)
- Dedicated spoke VNet
- Private connectivity to shared services
- Restricted NSG rules
- Production-grade monitoring

### Client B (Operations Tool)
- Separate spoke VNet
- Different address space
- Same security and monitoring baseline
- Independent lifecycle from Client A

Both clients inherit the same foundational controls without custom redesign.

---

## 8. Future Enhancements (Phase 2)
- Azure Policy initiatives for:
  - Mandatory tagging
  - Diagnostics enforcement
  - Allowed regions
- Azure Firewall or NVA in hub
- Private Endpoints + Private DNS
- Management Group hierarchy for multi-subscription scale

The current foundation supports these enhancements without re-architecture.
