require 'watir-page-helper'

module WatirPageHelper::Bing
  module HomePage
    extend WatirPageHelper::ClassMethods

    # no country redirect link, since travis-ci ends up getting sent to the german site
    direct_url "http://www.bing.com/?scope=web&setmkt=en-US&setlang=match&FORM=W5WA&uid=30302BA1"
    expected_title "Bing"

    text_field :search, :name => "q"
    button :bing_search, :name => 'go'

    def search_for term
      self.search_text_field.when_present.set term
      self.search_text_field.respond_to?(:send_keys) ? self.search_text_field.send_keys(:enter) : @browser.send_keys('{ENTER}')
    end
  end
end
