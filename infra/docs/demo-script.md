# 5-Minute Azure Landing Zone Demo Script

## 1. Repo Structure (≈1 minute)
“Let me start with the repository structure.

The repo is organized to separate environments from reusable logic.
- `infra/envs` contains environment-specific configurations (dev, prod)
- Terraform Cloud workspaces map one-to-one with environments
- GitHub is the source of truth — no manual portal builds

This structure makes onboarding a new environment mostly a configuration exercise, not a redesign.”

---

## 2. Terraform Cloud Plan & Apply (≈1.5 minutes)
“Terraform Cloud handles execution and state.

A run starts when code is committed to GitHub.
- Terraform generates a plan showing exactly what will change
- Plans are reviewable and auditable
- Applies are non-interactive using a service principal

This removes reliance on individual admins and ensures predictable changes.”

---

## 3. What Gets Deployed (≈1 minute)
“The deployment provisions the platform foundation:
- Resource group separation
- Hub-and-spoke VNets with controlled peering
- Subnet-level security using NSGs
- Central Log Analytics workspace
- Consistent tagging across all resources

This is intentionally focused on the foundation, not application workloads.”

---

## 4. Portal Verification (≈45 seconds)
“The Azure Portal is used only for validation.

Here I can quickly show:
- VNets and peering relationships
- NSG associations at subnet level
- Centralized monitoring resources

The portal provides visibility, but Terraform remains the source of truth.”

---

## 5. How This Scales (≈45 seconds)
“To onboard a new client or business unit:
- Create a new workspace
- Provide environment variables (location, tags, prefix)
- Reuse the same architecture pattern

In Phase 2, I’d layer in:
- Policy-as-code for governance
- Management groups for scale
- Firewalls and private endpoints for higher security tiers

The foundation is designed to evolve without rework.”
