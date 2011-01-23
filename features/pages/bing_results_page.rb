class BingResultsPage

  attr_accessor :results, :conversion_result

  def initialize(browser)
    @browser = browser
    @results = @browser.span(:id => "count")
    @conversion_result = @browser.span(:class => "sc_bigLine")
  end

  def method_missing(sym, *args, &block)
    @browser.send sym, *args, &block
  end

  def number_search_results
    result = /^[\s\w-]* of ([\d,]+) results$/.match(@results.text)
    raise "Could not determine number of search results from: '#{@results.text}'" if not result
    result.captures[0].gsub(",","").to_i
  end

end