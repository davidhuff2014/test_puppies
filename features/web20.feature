Feature: Testing Web 2.0

  Scenario: Dynamic Table Example
    Given I am on the google DynaTable Example page
    When I select the schedule for Monday
    Then I should see that Inman Mendez has a class at Mon 9:45-10:35
    And I should see that Omar Smith has a class at Mon 4:30-5:20
    When I select the schedule for Tuesday
    Then I should see that Eddie Edelstein has a class at Tues 12:15-1:05
    And I should see that Teddy Gibbs has a class at Tues 10:00-10:50
    And I should see that Teddy Gibbs has a class at Tues 3:15-4:05


