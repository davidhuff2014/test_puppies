Feature: Testing Web 0.1
  
  Scenario: Learning about Frames
    Given I am on the frames page
    When I send the text "frames are not my friend"
    Then the receiver should have "frames are not my friend"

  Scenario: Testing with alert popups
    Given I am on the frames page
    When I popup the alert
    Then the text from the alert should read "I am an alert"

  Scenario: Testing with confirm popups
    Given I am on the frames page
    When I popup the confirm
    Then the text from the confirm should read "set the value"


