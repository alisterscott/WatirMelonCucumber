TEST_DATA_DIR = "./features/test_data"

if ENV["HEADLESS"] then
  require "celerity"
  browser = Celerity::Browser.new
  INDEX_OFFSET = 0
  WEBDRIVER = false
else
  require 'watir-webdriver'
  require 'watir-webdriver/extensions/wait'
  browser = Watir::Browser.new :firefox
  INDEX_OFFSET = -1
  WEBDRIVER = true
end

BROWSER_CLASS = browser.class

Before do
  @browser = browser
end

at_exit do
  browser.close
end