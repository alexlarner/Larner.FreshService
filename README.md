# Larner.FreshService

Creates a PowerShell API around the FreshService API.

## Usage

This was used to generate and close tickets to document the automated work that was done for the below automation solution that I created for a company:

Automated the IT onboarding & offboarding of all associates and all the user property updates (i.e. name change, job title/location/department change) by integrating our HR system with Active Directory. The automated system:

- Created, updated, and disabled Active Directory & Entra accounts
- Sanitized & standardized input data from HR to align with ISO standards (i.e. country & state/province name, etc.) and created tickets for HR to fix data that was too incorrect to be sanitized

The aforementioned tickets included tasks for each part of the process so we’d have a “paper” trail for internal audit, for this automation. It also created and assigned tasks to humans for special handling for exceptional cases (i.e. offboarding of an Admin/high-profile user)

## Branch Differences

The DEV branch was in the process of being converted to use classes to allow for implicit type conversion (i.e. specify ID or Email for a parameter value instead of the full [Agent](/Source/Classes/01%20Agent.ps1) object) and to set consistent custom ToString methods for better logging.
