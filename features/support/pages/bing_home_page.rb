class BingHomePage < SearchPageClass

  direct_url "http://www.bing.com"
  expected_title "Bing"

  #text_field :search, :name => "q"
  button :bing_search, :name => "go"

  def search_for term
    self.search = term
    bing_search
    BingResultsPage.new(@browser)
  end

end
