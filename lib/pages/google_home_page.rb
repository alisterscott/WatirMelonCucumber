class GoogleHomePage < SearchPageClass

  direct_url "http://www.google.com"
  expected_title "Google"
  link :go_to_google_usa, :text => 'Go to Google.com'

  def search_for term
    go_to_google_usa if go_to_google_usa_link.exists?
    self.search = term
    self.search_text_field.send_keys :enter
    GoogleResultsPage.new(@browser, false)
  end
end