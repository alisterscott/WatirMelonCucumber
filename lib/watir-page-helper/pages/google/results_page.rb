require 'watir-page-helper'
require 'rspec/expectations'

module WatirPageHelper::Google
  module ResultsPage
    extend WatirPageHelper::ClassMethods
    
    expected_title /Google.*/
    expected_element :div, :id => "resultStats"

    div :results, :id => "resultStats"

    def number_search_results
      result = /[\s\D]*([\d,]+) results \(\d+\.\d+ seconds\)/.match(results)
      raise "Could not determine number of search results from: '#{results}'" if not result
      result.captures[0].gsub(",","").to_i
    end

    def conversion_result
      lhs_d = @browser.text_field(:id => "ucw_lhs_d").value
      lhs_u = @browser.select_list(:id => "ucw_lhs_u").value
      rhs_d = @browser.text_field(:id => "ucw_rhs_d").value
      rhs_u = @browser.select_list(:id => "ucw_rhs_u").value
      return lhs_d + " " + lhs_u + " = " + rhs_d + " " + rhs_u
    end
  end
end
