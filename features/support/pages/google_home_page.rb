class GoogleHomePage
  include PageMixIn

  attr_accessor :search_field, :google_search_button

  URLS = { :production => "http://www.google.com/" }

  def initialize(browser)
    @browser = browser
    @google_search_button = @browser.button(:name => "btnG")
    super
  end

  def visit
    @browser.goto URLS[:production]
  end

  def search_for term
    self.search_field.set term
    self.google_search_button.click
    google_results_page = GoogleResultsPage.new(@browser)
    google_results_page.results.wait_until_present if WEBDRIVER
    google_results_page
  end
end
