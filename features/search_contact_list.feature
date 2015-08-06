Feature: Search Contact List

  Scenario: find a phone number from the collection
    Given I have a phone book:
      | name                  | phone                 |
      | Geoffrey Gutkowski    | 1-269-592-3128 x2592  |
      | Ms.  Kurtis Gleichner | (950) 463-6592 x1963  |
      | Lyric Huels           | 1-280-727-0791        |
      | Jordyn White          | 310.797.4771 x23400   |
      | Roberta Weber         | 1-401-226-7860        |
    When I look up the phone number for "Ms.  Kurtis Gleichner"
    Then I should see the phone number "(950) 463-6592 x1963"
