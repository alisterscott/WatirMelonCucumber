class GoogleResultsPage

  attr_accessor :results, :conversion_result

  def initialize(browser)
    @browser = browser
    @results = self.div(:id => "resultStats")
    @conversion_result = self.h2(:class => "r")
  end

  def method_missing(sym, *args, &block)
    @browser.send sym, *args, &block
  end

  def number_search_results
    result = /[\s\D]*([\d,]+) results \(\d+\.\d+ seconds\)/.match(@results.text)
    raise "Could not determine number of search results from: '#{@results.text}'" if not result
    result.captures[0].gsub(",","").to_i
  end

end