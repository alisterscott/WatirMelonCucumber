TEST_DATA_DIR = "./features/support/test_data"

require 'watir-webdriver'
require 'watir-page-helper'
require File.dirname(__FILE__)+'/pages/base_page_class'
require File.dirname(__FILE__)+'/pages/search_page_class'

if ENV["HEADLESS"] then
  include Selenium
  capabilities = WebDriver::Remote::Capabilities.htmlunit(:javascript_enabled => true)
  browser = Watir::Browser.new(:remote, :url => "http://127.0.0.1:4444/wd/hub", :desired_capabilities => capabilities)
else
  browser = Watir::Browser.new :chrome
end

Before do
  @browser = browser
end

at_exit do
  browser.close
end