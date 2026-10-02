Feature: Claim submission and status

  @story-3
  Rule: An employee may add a note to their claim, including contact details for finance

    Scenario: Dana adds a note with her phone number
      Given Dana the employee has uploaded and corrected a receipt from "Riverside Kitchen"
      When she adds the note "Call me at 555-0142 if anything's unclear" and submits the claim
      Then her submitted claim carries the note "Call me at 555-0142 if anything's unclear"

  @story-4
  Rule: Submitting a claim sends it to the employee's manager for review

    Scenario: Dana submits a completed claim
      Given Dana the employee has uploaded and corrected a receipt from "Riverside Kitchen"
      When Dana submits the claim
      Then the claim appears among the claims awaiting her manager's decision

    @negative
    Scenario: An incomplete claim cannot be submitted
      Given Dana the employee has uploaded a receipt whose total could not be read
      When Dana tries to submit the claim without filling in the total
      Then the claim is not submitted

  @story-5
  Rule: An employee can see the status of their own submitted claims

    Scenario: Dana checks a decided claim
      Given Dana the employee's claim from "Office Depot" has been approved
      When Dana looks at her claims
      Then she sees the "Office Depot" claim marked "Approved"
