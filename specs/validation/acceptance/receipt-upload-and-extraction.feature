Feature: Receipt upload and extraction

  @story-1
  Rule: Uploading a receipt automatically fills in its merchant, date and total

    Scenario: Uploading a legible receipt fills in the claim fields
      Given Dana the employee has a photo of her receipt from "Riverside Kitchen" dated "October 1, 2026" for "$42.50"
      When Dana uploads the receipt
      Then the claim form shows "Riverside Kitchen" as the merchant, "October 1, 2026" as the date and "$42.50" as the total

  @story-1 @story-4
  Rule: A gambling or betting receipt cannot be submitted as a claim

    @negative
    Scenario: A casino receipt is blocked from submission
      Given Dana the employee has uploaded a receipt from "Lucky Star Casino"
      When Dana tries to submit the claim
      Then the claim is not submitted

  @story-2
  Rule: An employee may correct the automatically extracted fields before submitting

    Scenario: Dana fixes a misread total
      Given Dana the employee has uploaded a receipt that filled in a total of "$42.50"
      When Dana changes the total to "$45.00" before submitting
      Then her submitted claim shows a total of "$45.00"
