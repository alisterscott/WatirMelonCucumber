class BingHomePage < SearchPageClass

  direct_url "http://www.bing.com/"
  expected_title "Bing"

  button :bing_search, :name => 'go'
  link :switch_to_english, :text => 'English'

  def search_for term
    switch_to_english if switch_to_english_link.exists?

    self.search_text_field.when_present.set term
    self.search_text_field.respond_to?(:send_keys) ? self.search_text_field.send_keys(:enter) : @browser.send_keys('{ENTER}')
  end

end