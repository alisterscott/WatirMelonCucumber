class GoogleHomePage < SearchPageClass

  direct_url "http://www.google.com"
  expected_title "Google"
  link :go_to_google_usa, :text => 'Go to Google.com'
  link :go_to_google_in_english, :text => 'Google.com in English'

  def search_for term
    go_to_google_usa if go_to_google_usa_link.exists?
    go_to_google_in_english if go_to_google_in_english_link.exists?

    self.search = term
    self.search_text_field.respond_to?(:send_keys) ? self.search_text_field.send_keys(:enter) : @browser.send_keys('{ENTER}')
  end
end