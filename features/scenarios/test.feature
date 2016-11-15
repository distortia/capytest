Feature: Testing

  Background:
  Given I am a web app user
  And I am on the home page

  Scenario: Testing scenario
    And I click the form authentication link
    Then I am on the login page
    And the fork me on github button is visible
  @run
  Scenario: Invalid login
    And I click the form authentication link
    Then I am on the login page
    And I click the login button
    Then I am on the login page
    Then the error message contains "Your username is invalidd"
