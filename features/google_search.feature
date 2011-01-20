Feature: Google Search

Scenario: Search for Watir
  Given I am on the Google Home Page
  When I search for "Watir"
  Then I should see at least 100,000 results

Scenario: Do a unit conversion
  Given I am on the Google Home Page
  When I convert 10 cm to inches
  Then I should see the conversion result "10 centimeters = 3.93700787 inches"

Scenario: Do a search using data specified externally
  Given I am on the Google Home Page
  When I search for a ridiculously small number of results
  Then I should see at most 5 results
