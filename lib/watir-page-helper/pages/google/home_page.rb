require 'watir-page-helper'

module WatirPageHelper::Google
  module HomePage
    extend WatirPageHelper::ClassMethods
    
    # no country redirect link, since travis-ci ends up getting sent to the german site
    direct_url "http://www.google.com/ncr"
    expected_title "Google"

    text_field :search, :name => "q"

    def search_for term
      self.search = term
      self.search_text_field.respond_to?(:send_keys) ? self.search_text_field.send_keys(:enter) : @browser.send_keys('{ENTER}')
    end
  end
end
