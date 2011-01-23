class BingHomePage

  attr_accessor :search_field, :bing_search_button

  URLS = { :production => "http://www.bing.com/" }

  def initialize(browser)
    @browser = browser
    @search_field         = @browser.text_field(:name => "q")
    @bing_search_button  = @browser.button(:name => "go")
  end

  def method_missing(sym, *args, &block)
    @browser.send sym, *args, &block
  end

  def visit
    @browser.goto URLS[:production]
  end

  def search_for term
    self.search_field.set term
    self.bing_search_button.click
    bing_results_page = BingResultsPage.new(browser)
    bing_results_page.results.wait_until_present if WEBDRIVER
    bing_results_page
  end

end
