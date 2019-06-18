Feature: Make a search on Amazon
  Make a search on Amazon using the top search bar and apllying sort and filters

Scenario: Filter the search by case material polycarbonate
    Given I am on Amazon home page
    When I enter the text "iphone case" on the top search bar
    And I select Polycarbonate as Cell Phone Case Material
    And I sort the results by "Price: High to Low"
    Then I get the results in the correct order
