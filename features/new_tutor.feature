Feature: Create a new Tutor
  As a first time tutor
  So that I can create an account
  I want to input all the relevant fields: name, tutor type, and personal details like email
  Background: tutors in database

    Given the following tutors exist:
      | type_of_tutor| grade_level | email          | password   | password_confirmation | confirmed_at         |first_name  | last_name|
      | 20 hour TA   | 3rd         | a@berkeley.edu | password   | password              | 2019-05-07 05:07:48  | alvin      | a        |
      | 8 hour tutor | 4th         | b@berkeley.edu | password   | password              | 2019-05-07 05:07:48  | divinee    | b        |
      | AI           | 2nd         | c@berkeley.edu | password   | password              | 2019-05-07 05:07:48  | Gloria     | c        |
      | 10 hour TA   | 3rd         | d@berkeley.edu | password   | password              | 2019-05-07 05:07:48  | AJ         | d        |


    Given the following berkeley_classes exist:
      |CS61A | CS61B | CS61C | CS70  | EE16A | CS88  | CS10  | DATA8 |
      |true  | false | false | false | false | false | false | false |
      |true  | false | false | false | false | false | false | false |
      |true  | false | false | false | false | false | false | false |
      |true  | false | false | false | false | false | false | false |

      

  Scenario: create a new tutor called Emma
    Given I am on the home page
    And I press "Tutor"
    And I follow "Register here"
    And I fill in "First name" with "Emma"
    And I fill in "Last name" with "e"
    And I fill in "Email" with "e@berkeley.edu"
    And I fill in "Birthday" with "1997/01/01"
    And I fill in "Password (6 char. minimum)" with "password"
    And I fill in "Confirm Password" with "password"
    And "Female" is selected for "Gender"
    And I fill in "Major" with "Computer Science"
    And "false" is selected for "Are you a DSP student?"
    And "false" is selected for "Are you a DSP student?"
    And "CSM (8-12 hours)" is selected for "Type of tutor"
    And I fill in "Sid" with "1234567890"
    And I check "classes[CS61A]"
    And I press "Create New Tutor"
    Then I should see "Emma was successfully created."
    And I should not see "CS61B"
    And I should not see "CS61C"
    And I should not see "CS70"
    And I should not see "EE16A"
    And I should not see "CS88"
    And I should not see "CS10"
    And I should not see "DATA8"

  Scenario: I fail to create a tutor
    Given I am on the home page
    And I press "Tutor"
    And I follow "Register here"
    And I press "Create New Tutor"
    Then I should not see "Tutor was not successfully created."