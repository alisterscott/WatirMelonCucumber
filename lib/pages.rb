require 'pages/base_page_class.rb'
require 'pages/search_page_class'
Dir["#{File.dirname(__FILE__)}/pages/*_page.rb"].each {|r| load r }