Feature: Using the database in our tests

  Scenario: Creating a new order in the database
    Given I know how many orders I have
    When I create a new order
    Then I should have 1 additional order

  Scenario: Read an order object from the database
    Given I have an order for "George Washington"
    When I read that order
    Then the order should have the name "George Washington"

