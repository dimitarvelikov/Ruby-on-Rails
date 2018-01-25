Feature: Forum post
  As a logged in user
  I want to be able to create a new thread post on the CSA
  So that other CSA users can reply to my post

  Scenario: Create a thread post
    Given that user "admin" with password "taliesin" has logged in
    When the user creates a new anonymous thread with the title "Assignment help" with the body "I need help"
    Then the current page should contain a new row containing the data:
      | Title           | Author    | Unread posts | Total number posts |
      | Assignment help | Anonymous | 0            | 0                  |

    Given that another user "dpv" with password "aber" has logged in
    When the user opens the forum page and clicks on the thread with the title "Assignment help"
    Then the user creates a new thread reply with the text "Hello World!"
    Then the current page should contain a row containing the data:
      | Title           | Author    | Unread posts | Total number posts |
      | Assignment help | Anonymous | 0            | 1                  |

    When the current user signs out and the user "admin" with password "taliesin" logs back in
    Then the user goes to the forum tab the page should contain a row containing the data:
      | Title           | Author    | Unread posts | Total number posts |
      | Assignment help | Anonymous | 1            | 1                  |
    And the user should have one notification