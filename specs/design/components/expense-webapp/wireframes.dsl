// Expense Claims Guard — Employee and Manager, four screens

screen MyClaims "Employee tracks the status of claims they've submitted"
  navbar "ExpenseGuard"
  sidebar "My Claims -> MyClaims | New Claim -> NewClaim"
  row
    heading "My Claims"
    right
    button "New Claim" primary -> NewClaim
  table "Merchant | Date | Total | Status"
    row "Riverside Kitchen | Oct 1, 2026 | $42.50 | Submitted"
    row "Office Depot | Sep 28, 2026 | $18.00 | Approved"
    row "Downtown Taxi | Sep 20, 2026 | $26.75 | Rejected"

screen NewClaim "Employee uploads a receipt and the merchant, date and total are filled in automatically"
  navbar "ExpenseGuard"
  sidebar "My Claims -> MyClaims | New Claim -> NewClaim"
  breadcrumb "My Claims / New Claim"
  heading "New Claim"
  card "Receipt"
    image "Receipt photo or PDF"
    button "Upload"
  card "Extracted Details"
    input "Merchant — Riverside Kitchen"
    input "Date — Oct 1, 2026"
    input "Total — $42.50"
    badge "Looks OK" success
  textarea "Note — add context, including how to reach you"
  row
    right
    button "Cancel" -> MyClaims
    button "Submit Claim" primary -> MyClaims

screen TeamClaims "Manager reviews every claim submitted by their direct reports"
  navbar "ExpenseGuard"
  sidebar "Team Claims -> TeamClaims | My Claims -> MyClaims | New Claim -> NewClaim"
  row
    heading "Team Claims"
    right
    select "Status: Submitted"
  table "Employee | Merchant | Date | Total | Status" -> ClaimDetail
    row "Dana Lee | Riverside Kitchen | Oct 1, 2026 | $42.50 | Submitted"
    row "Sam Patel | Office Depot | Sep 28, 2026 | $18.00 | Submitted"

screen ClaimDetail "Manager reviews one claim and approves or rejects it"
  navbar "ExpenseGuard"
  sidebar "Team Claims -> TeamClaims | My Claims -> MyClaims | New Claim -> NewClaim"
  breadcrumb "Team Claims / Riverside Kitchen"
  row
    heading "Riverside Kitchen"
    badge "Submitted" info
  text "Dana Lee — Oct 1, 2026 — $42.50"
  card "Receipt"
    image "Receipt photo"
  text "Note: call me at 555-0142 if anything's unclear"
  row
    right
    button "Reject" danger -> TeamClaims
    button "Approve" primary -> TeamClaims

flow "My claims"
  role "Employee"
  description "An employee uploads a receipt, submits a claim, and tracks its status"
  MyClaims
  NewClaim

flow "Team approvals"
  role "Manager"
  description "A manager reviews their direct reports' claims, decides each one, and submits and tracks their own claims too"
  TeamClaims
  ClaimDetail
  MyClaims
  NewClaim
