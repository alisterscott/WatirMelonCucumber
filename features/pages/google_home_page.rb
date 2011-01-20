class GoogleHomePage < DelegateClass(BROWSER_CLASS)

  attr_accessor :search_field, :google_search_button

  URLS = {
    :production => "http://www.google.com/"
  }

  def initialize(browser)
    super(browser)
    @search_field         = self.text_field(:name => "q")
    @google_search_button = self.button(:name => "btnG")
  end

  def visit
    self.goto URLS[:production]
  end

  def page_title
    self.title
  end

  def search_for term
    self.search_field.set term
    self.google_search_button.click
    google_results_page = GoogleResultsPage.new(browser)
    google_results_page.results.wait_until_present if WEBDRIVER
    google_results_page
  end

end
