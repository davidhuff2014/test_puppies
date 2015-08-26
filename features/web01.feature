Feature: Testing Web 0.1
  
  Scenario: Learning about Frames
    Given I am on the frames page
    When I send the text "Frames are not my friend"
    Then the receiver should have "frames are not my friend"