TEST_DATA_DIR = "./features/support/test_data"
$: << File.dirname(__FILE__)+'/../../lib'

require 'watir-webdriver'
require 'watir-page-helper/commands'

World WatirPageHelper::Commands

WatirPageHelper.create

After do
  WatirPageHelper.browser.cookies.clear
end

at_exit do
  WatirPageHelper.close
end