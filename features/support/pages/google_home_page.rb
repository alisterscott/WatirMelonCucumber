class GoogleHomePage < SearchPageClass

  direct_url "http://www.google.com"
  expected_title "Google"

  #text_field :search, :name => "q"
  button :google_search, :name => "btnG"

  def search_for term
    self.search = term
    google_search
    GoogleResultsPage.new(@browser, false)
  end
end
