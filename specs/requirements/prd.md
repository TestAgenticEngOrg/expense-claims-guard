# expense-claims-guard — PRD

## Problem Statement

Employees who pay for work expenses out of pocket today have to manually type
in the merchant, date and total from every receipt, and keep a paper trail so
finance can later reach them with questions. Managers reviewing those claims
have no single place to see their team's submissions, approve or reject them,
and make sure payouts stay within policy — for example, that gambling and
betting expenses never slip through as reimbursable.

## Solution

A simple expense claims web app where employees upload a photo or PDF of a
receipt and have its merchant, date and total filled in automatically, correct
them if needed, add a note, and submit; and where managers see their team's
claims in one place and approve or reject each one. Claims for gambling or
betting are never accepted.

## Actors

- **Employee** — signs in, uploads receipts, reviews and corrects the
extracted merchant/date/total, adds a note, submits claims, and sees the
status of their own claims. Every employee reports to a manager, including
managers themselves.
- **Manager** — everything an Employee can do for their own claims, plus sees
every claim submitted by the people who report to them, and approves or
rejects each one.

## User Stories

1. As an Employee, I want to upload a photo or PDF of a receipt, so that its
merchant, date and total are filled in for me automatically.
2. As an Employee, I want to review and correct the automatically extracted
merchant, date and total, so that my claim is accurate before I submit it.
3. As an Employee, I want to add a short note to my claim, so that I can give
finance context, including how to reach me if they have questions.
4. As an Employee, I want to submit a completed claim, so that my manager can
review it.
5. As an Employee, I want to see the status of my submitted claims, so that I
know whether each was approved or rejected.
6. As a Manager, I want to see every claim submitted by the people who report
to me, so that I can review them in one place.
7. As a Manager, I want to approve or reject each claim, so that only
legitimate, in-policy expenses are reimbursed.
8. As a Manager, I want my own claims routed to my own manager for approval,
so that my spending is reviewed independently rather than by me.

## Product Decisions

- Sign-in is via SSO through Thunder, the platform identity provider (org
default).
- Receipt data extraction is performed by an agent: it reads the uploaded
photo or PDF and fills in merchant, date and total automatically; the
employee can still correct any of the three before submitting.
- Guardrail: the receipt-reading agent flags gambling and betting merchants,  
and a claim it flags cannot be submitted — gambling and betting expenses are  
never claimable.

- Finance has no role or screen inside the app; the contact details employees
put in their notes are read and used by finance entirely outside the
system, exactly as today.
- Every employee, including every manager, has their own manager in the
reporting hierarchy, and that is who approves their claims. Everyone on this
team has a manager above them, so there is no top-of-hierarchy case to
handle.
- Employees are notified of a decision (approved/rejected) only inside the
app, on their claims list — no email or other out-of-band notification.
- A manager rejecting a claim needs no reason — it is a single action with no
required text.

## Out of Scope

- Multi-level approval chains beyond the claimant's own manager.
- Finance-facing screens, reporting, export, or payroll/accounting
integration.
- Editing or resubmitting a claim after a manager has decided on it.
- Multi-currency handling and expense categories other than a single receipt
per claim.
- Delegated or out-of-office approval (a second manager standing in).

## Open Questions

None.

## Further Notes

None.