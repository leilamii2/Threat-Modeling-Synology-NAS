# Threat Modeling and Security Assessment of a NAS Storage System

## Project Overview

This repository contains the complete threat modeling and security assessment 
of a Synology DS416play NAS device deployed in a small office network 
(accounting and HR firm, Brussels).

The assessment combines three complementary methodologies:
- **Phase 1**: Black-box reconnaissance (Nmap)
- **Phase 2**: Grey-box vulnerability validation (Nessus)
- **Phase 3**: White-box threat analysis (STRIDE + configuration review)

## 📋 Contents

- `Threat_Modeling_master.pdf` - Final assessment report (12 pages)
- `scan_results/` - Raw Nmap and Nessus output files
- `configurations/` - DSM configuration screenshots and analysis
- `dfd/` - Data Flow Diagrams (network topology, DFD)
- `resources/` - Supplementary materials and references

## 🔍 Key Findings

### Critical Vulnerabilities Identified
1. **Unencrypted SMB traffic** - GDPR data exposure risk
2. **Weak administrative authentication** - No mandatory 2FA
3. **Disabled audit logging** - Forensic investigation gaps
4. **AFP cleartext authentication** - Credential interception risk
5. **Disabled SMB message signing** - Man-in-the-Middle attack exposure

### Risk Summary
- **3 Critical threats** requiring immediate remediation
- **29 total threats** identified across STRIDE categories
- **70-80% risk reduction** achievable through 6 priority mitigations

## 🛡️ Recommended Mitigations

**Critical Priority (Implement Immediately):**
1. Enable SMB 3.1.1 encryption and message signing
2. Enforce Two-Factor Authentication (2FA) for admin access
3. Disable HTTP port 5000, enforce HTTPS-only
4. Enable file operation audit logging
5. Implement role-based access control (eliminate shared accounts)
6. Enable DSM firewall with strict inbound rules

**Implementation Effort:** Minimal (leverages built-in DSM features)  
**Cost:** Zero (no additional infrastructure required)

## 📊 Assessment Methodology

### STRIDE Framework
The threat model systematically addresses six threat categories:
- **S**poofing: Authentication bypass and credential theft
- **T**ampering: Data modification and integrity violations
- **R**epudiation: Denial of action (lack of audit trails)
- **I**nformation Disclosure: Confidentiality breaches
- **D**enial of Service: Availability attacks
- **E**levation of Privilege: Unauthorized access escalation

### Tools Used
- **Nmap 7.98** - Network reconnaissance and service enumeration
- **Nessus Professional** - Vulnerability validation
- **Synology DSM** - Configuration analysis
- **Data Flow Diagrams (DFD)** - Trust boundary mapping


## 🔐 Confidentiality & Data Protection

- **All sensitive identifiers anonymized** (IPs, MACs, hostnames)
- **No credentials or authentication tokens exposed**
- **Assessment conducted with formal organizational authorization**
- **Compliance with data protection regulations (GDPR)**

## 👤 Author

**Leila MESSAOUDI**  
Master's Student in Cybersecurity  
UCL/ULB, Brussels

### Academic Context
- Course: ELEC-H550 - Embedded Systems Security
- Institution: Université Catholique de Louvain (UCL)
- Supervisor: Prof. Jan Tobias Mühlberg
- Assessment Period: November - January 2025-2026

## 📚 References

### Security Standards & Frameworks
- NIST SP 800-115: Technical Security Testing
- CIS Benchmarks: Synology NAS Security Configuration
- Microsoft SDL: STRIDE Threat Modeling Framework
- OWASP Top 10: Web Application Security

### Tool Documentation
- [Nmap Documentation](https://nmap.org/docs.html)
- [Nessus User Guide](https://docs.tenable.com/nessus/)
- [Synology DSM Security Guide](https://www.synology.com/)
- [STRIDE Framework - Microsoft](https://www.microsoft.com/en-us/securityengineering/sdl/threats)

### GDPR Compliance
- EU Regulation 2016/679 (GDPR)
- Article 32: Security of Processing
- Article 33: Breach Notification

## 📝 License

This project is provided for educational and authorized security assessment 
purposes only. Unauthorized access to computer systems is illegal.

**Licensed under:** GNU General Public License v3.0

## ⚠️ Disclaimer

This assessment was conducted with explicit organizational authorization and 
is intended for internal security improvement purposes only. All findings are 
confidential and proprietary to the assessed organization.

Reproduction, distribution, or public disclosure of specific organizational 
details without consent is prohibited.

---

**Last Updated:** January 2026  
**Report Version:** Final (ELEC-H550)


