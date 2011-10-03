class BingResultsPage < BasePageClass

  expected_title /.+ Bing/
  expected_element :span, :id => "count"

  span :results, :id => "count"
  span :conversion_result, :class => "sc_bigline"

  def number_search_results
    result = /^[\s\w-]* of ([\d,\.]+) results$/.match(results)
    raise "Could not determine number of search results from: '#{results}'" if not result
    result.captures[0].gsub(",","").gsub(".", "").to_i
  end

end