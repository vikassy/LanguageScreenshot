@firefox @language_screenshot
Feature: Language Screenshot

  Scenario: VisualEditor_Toolbar_Headings
    Given I am editing a random page
    When I click the down arrow on Headings interface
    Then I should see Headings pull-down menu

  Scenario: VisualEditor_Toolbar_Formatting
    Given I am editing a random page
    When I click the text style menu
    Then I should see Formatting pull-down menu

  Scenario: VisualEditor_More_Settings
    Given I am editing a random page
    When I click the hamburger menu
    Then I should see pull-down menu containing Page Settings

  Scenario: VisualEditor_Insert_Menu
    Given I am editing a random page
    When I click on the Insert menu
    Then I should see Insert pull-down menu

  Scenario: VisualEditor_Toolbar_SpecialCharacters
    Given I am editing a random page
    When I click on the Special character option in Insert menu
    Then I should see Special character Insertion window

  @login
  Scenario: New_VE_save_dialog
    Given I am logged in
      And I am edit a random page with Testing Save
    When I click Save page
    Then I should see save changes dialog box

  Scenario: VisualEditor_Page_Settings
    Given I am editing a random page
      And I click the hamburger menu
    When I click on Page settings option
    Then I should see Page settings dialog box

  Scenario: VisualEditor_Toolbar_Lists_and_indentation
  	Given I go to the Indent Outdent VisualEditor Test page
      And I make the text "Indent Outdent" be selected
    When I click Bullets
      And I click on list and indentation dropdown
    Then I should see list and indentation dropdown
