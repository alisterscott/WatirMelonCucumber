require 'watir-page-helper'

module WatirPageHelper::Bing
    module ResultsPage
    extend WatirPageHelper::ClassMethods
    
    expected_title /.+ Bing/
    expected_element :span, :id => "count"

    span :results, :id => "count"
    p :conversion_result, :class => "cipd"

    def number_search_results
      result = /([\d,]+) RESULTS$/.match(results)
      raise "Could not determine number of search results from: '#{results}'" if not result
      result.captures[0].gsub(",","").gsub(".", "").to_i
    end
  end
end
