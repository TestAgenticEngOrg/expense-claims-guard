Feature: Manager review and approval

  @story-6
  Rule: A manager sees every claim submitted by their direct reports

    Scenario: A manager opens the team claims list
      Given Dana the employee reports to Priya the manager and has submitted a claim from "Riverside Kitchen"
      When Priya opens her team's claims
      Then she sees Dana's "Riverside Kitchen" claim in the list

    @negative
    Scenario: A manager does not see claims from employees who do not report to them
      Given Sam the employee does not report to Priya the manager and has submitted a claim from "Office Depot"
      When Priya opens her team's claims
      Then she does not see Sam's "Office Depot" claim

  @story-7
  Rule: A manager approves or rejects each submitted claim

    Scenario: Priya approves a submitted claim
      Given Dana the employee has a claim from "Riverside Kitchen" awaiting Priya the manager's decision
      When Priya approves the claim
      Then the claim is marked "Approved"

    Scenario: Priya rejects a submitted claim
      Given Dana the employee has a claim from "Downtown Taxi" awaiting Priya the manager's decision
      When Priya rejects the claim
      Then the claim is marked "Rejected"

  @story-8
  Rule: A manager's own claims are decided by their own manager, not by themselves

    Scenario: A manager's claim goes to their manager instead of themselves
      Given Priya the manager reports to Jordan and has submitted a claim from "Airport Parking"
      When Priya looks at the claims awaiting her own decision
      Then her "Airport Parking" claim is not among them

    @negative
    Scenario: A manager cannot approve their own claim
      Given Priya the manager has submitted a claim from "Airport Parking" awaiting a decision
      When Priya tries to approve her own "Airport Parking" claim
      Then the claim is not approved
