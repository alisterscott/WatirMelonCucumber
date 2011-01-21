Given /^I am on the (.+)$/ do |page_name|
  @google_home_page = Object.const_get(page_name.gsub(" ","")).new(@browser)
  @google_home_page.visit
end

When /^I search for a? ?"([^"]*)"$/ do |term|
  @google_results_page = @google_home_page.search_for term
end

When /^I search for a?n? ?([^"].+[^"])$/ do |term|
  term = Common.get_search_term_data term
  @google_results_page = @google_home_page.search_for term
end

Then /^I should see at least ([\d,]+) results$/ do |exp_num_results|
  @google_results_page.number_search_results.should >= exp_num_results.gsub(",","").to_i
end

Then /^I should see at most ([\d,]+) results$/ do |exp_num_results|
  @google_results_page.number_search_results.should <= exp_num_results.gsub(",","").to_i
end

When /^I convert (.+)$/ do |conversion_statement|
  @google_results_page = @google_home_page.search_for "convert #{conversion_statement}"
end

Then /^I should see the conversion result "([^"]*)"$/ do |exp_conversion_result|
  @google_results_page.conversion_result.text.should == exp_conversion_result
end
