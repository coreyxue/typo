Feature: Article Merging
  As a blog administrator
  In order to do something
  I want to be able to merge similar articles

  Scenario: A non-admin cannot merge articles.
  	Given a normal blog is set up
  	And I have logged in as "user"
  	When I wrote article "New article"
  	When I follow "New article"
  	Then I should see "New article"
  	Then I should see "New article content"
  	Then I should not see "Merge Articles"

  Scenario: When articles are merged, the merged article should contain the text of both previous articles.
  	Given the blog is set up
    And I am logged into the admin panel
    Then I should see "Hello World!"
    When I wrote article "New article1"
    When I wrote article "New article2"
    #Then inspect
    When I follow "New article1"
    Then I should see "Merge Articles"
    When I fill in "merge_with" with "4"
    Then I press "Merge"
    Then I should see "New article1 content"
    And I should see "New article2 content"