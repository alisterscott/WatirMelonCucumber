class GoogleResultsPage < BasePageClass

  expected_title /Google.*/
  expected_element :div, :id => "resultStats"

  div :results, :id => "resultStats"
  h2 :conversion_result, :class => "r"

  def number_search_results
    result = /[\s\D]*([\d,]+) results \(\d+\.\d+ seconds\)/.match(results)
    raise "Could not determine number of search results from: '#{results}'" if not result
    result.captures[0].gsub(",","").to_i
  end

end
