TEST_DATA_DIR = "./features/support/test_data"
$: << File.dirname(__FILE__)+'/../../lib'

require 'watir-webdriver'
require 'watir-page-helper'
require 'pages.rb'

if ENV['HEADLESS']
  FileUtils.rm 'results.html' if File.exists? 'results.html'
  FileUtils.rm_rf 'screenshots' if File.exists? 'screenshots'
  FileUtils.rm_rf 'junit' if File.exists? 'junit'
  Dir::mkdir 'junit'

  require 'headless'
  headless = Headless.new
  headless.start
  at_exit do
    headless.destroy
  end
end

module Browser
  BROWSER = Watir::Browser.new ENV['WEB_DRIVER'] || :firefox

 def visit page_class, &block
    on page_class, true, &block
  end

  def on page, visit=false, &block
    page_class = Object.const_get "#{@site}#{page.to_s.capitalize}Page"
    page = page_class.new BROWSER, visit
    block.call page if block
    page
  end

  def site name
    @site = name
  end

end

World Browser

at_exit do
  Browser::BROWSER.close
end