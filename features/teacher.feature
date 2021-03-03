Feature: teacher login functionality

    As a teacher who has an application
    So that I can edit my information
    I can login via gmail

Scenario: Logging in as a teacher should be able to edit their info
  Given the following teachers exist:
  | first_name | last_name | admin | email                |
  | Joseph     | Mamoa     | false | testteacher@berkeley.edu |
  Given I have a teacher email
  Given I am on the BJC home page
  And   I follow "Log In"
  Then  I can log in with Google
  And   I see a confirmation "You can edit your information"
  Then  the "First Name" field should contain "Joseph"
  And   I enter my "First Name" as "Joe"
  And   I press "Submit"
  Then  the "First Name" field should contain "Joe"


Scenario: Logged in teacher can only edit their own information
  Given the following schools exist:
  |       name      |     city     |  state  |            website            |
  |   UC Berkeley   |   Berkeley   |   CA    |   https://www.berkeley.edu    |
  Given the following teachers exist:
  | first_name | last_name | admin | email                |
  | Joseph     | Mamoa     | false | testteacher@berkeley.edu |
  | Jane       | Austin    | false | testteacher2@berkeley.edu |
  Given I have a teacher email
  Given I am on the BJC home page
  And I follow "Log In"
  Then I can log in with Google
  When I go to teacher 2's edit page
  Then I should see "You can only edit your own information"

