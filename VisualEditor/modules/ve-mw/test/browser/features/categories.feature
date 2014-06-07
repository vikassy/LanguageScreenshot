@chrome @en.wikipedia.beta.wmflabs.org @firefox @login @test2.wikipedia.org
Feature: VisualEditor Page Option

  Background:
    Given I go to the "Category VisualEditor Test" page with content "Category VisualEditor Test"
      And I click in the editable part

  @language_screenshot
  Scenario: VisualEditor Category
    When I click on Page Option
    Then I should see Category option
