class GoogleHomePage < SearchPageClass

  direct_url "http://www.google.com"
  expected_title "Google"

  def search_for term
    self.search = term
    self.search_text_field.send_keys :enter
    GoogleResultsPage.new(@browser, false)
  end
end