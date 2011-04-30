module WatirPageHelper
  # A helper mixin to make accessing web elements via Watir-WebDriver easier.
  # This module assumes there is a @browser variable available.

  def self.included(cls)
    cls.extend ClassMethods
  end

  module ClassMethods

    # compares the expected title of a page, against the actual title of the browser.
    # The expected title can be a string or a regular expression pattern you are expecting.
    # Raises an error on non-match.
    def expected_title expected_title
      define_method("has_expected_title?") do
        has_expected_title = expected_title.kind_of?(Regexp) ? expected_title =~ @browser.title : expected_title == @browser.title
        raise "Expected title '#{expected_title}' instead of '#{@browser.title}'" unless has_expected_title
      end
    end

    def expected_element type, identifier
      define_method("expected_element") do
        @browser.send("#{type.to_s}", identifier).wait_until_present
      end
    end

    # provides a way for pages to specify a direct page url suffix, and for the page to go to the full URL
    def direct_url url
      define_method("goto") do
        @browser.goto url
      end
    end

    # adds three methods - one to put data in a text field, another
    # to fetch that data, and another to return the actual text_field.
    def text_field name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_text_field").value
      end
      define_method("#{name}=") do |value|
        self.send("#{name}_text_field").set value
      end
      define_method("#{name}_text_field") do
        block ? block.call(@browser) : @browser.text_field(identifier)
      end
    end

    # adds four methods - one to select an item in a drop-down,
    # another to fetch the currently selected item,
    # another to see if a particular value is selected
    # and another to return the select_list.
    def select_list name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_select_list").value
      end
      define_method("#{name}=") do |value|
        self.send("#{name}_select_list").select(value)
      end
      define_method("#{name}_selected?") do |value|
        self.send("#{name}_select_list").selected?(value)
      end
      define_method("#{name}_select_list") do
        block ? block.call(@browser) : @browser.select_list(identifier)
      end
    end

    # adds three methods - one to check, one to uncheck and
    # a third to return a checkbox
    def checkbox name, identifier=nil, &block
      define_method("check_#{name}") do
        self.send("#{name}_checkbox").set
      end
      define_method("uncheck_#{name}") do
        self.send("#{name}_checkbox").clear
      end
      define_method("#{name}_checkbox") do
        block ? block.call(@browser) : @browser.checkbox(identifier)
      end
    end

    # adds four methods - one to select, another to clear,
    # another to determine if the button is set
    # and another to return a radio button
    def radio_button name, identifier=nil, &block
      define_method("select_#{name}") do
        self.send("#{name}_radio_button").set
      end
      define_method("#{name}_set?") do
        self.send("#{name}_radio_button").set?
      end
      define_method("clear_#{name}") do
        self.send("#{name}_radio_button").clear
      end
      define_method("#{name}_radio_button")  do
        block ? block.call(@browser) : @browser.radio(identifier)
      end
    end

    # adds three methods - one click a button, another
    # to click a button without waiting for the action to
    # complete, and a third to return the button.
    def button name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_button").click
      end
      define_method("#{name}_no_wait") do
        self.send("#{name}_button").click_no_wait
      end
      define_method("#{name}_button") do
        block ? block.call(@browser) : @browser.button(identifier)
      end
    end

    # adds three methods - one to select a link, another
    # to select a link and not wait for the corresponding
    # action to complete, and a third to return the link.
    def link name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_link").click
      end
      define_method("#{name}_no_wait") do
        self.send("#{name}_link").click_no_wait
      end
      define_method("#{name}_link") do
        block ? block.call(@browser) : @browser.link(identifier)
      end
    end

    # adds a method that returns a table element
    #
    # Example:  table(:shopping_cart, {:index => 1})
    # will generate a 'shopping_cart' method
    def table name, identifier=nil, &block
      define_method(name) do
        block ? block.call(@browser) : @browser.table(identifier)
      end
    end

    # adds two methods - one to return the text within
    # a row and one to return a table row element
    def row name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_row").text
      end
      define_method("#{name}_row") do
        block ? block.call(@browser) : @browser.row(identifier)
      end
    end

    # adds a method to return the text of a table data <td> element
    # and another one to return the cell object
    def cell name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_cell").text
      end
      define_method("#{name}_cell") do
        block ? block.call(@browser) : @browser.cell(identifier)
      end
    end

    # adds a method that returns the content of a <div>
    # and another method that returns the div element
    def div name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_div").text
      end
      define_method("#{name}_div") do
        block ? block.call(@browser) : @browser.div(identifier)
      end
    end

    # adds a method that returns the content of a <span>
    # and another method that returns the span element
    def span name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_span").text
      end
      define_method("#{name}_span") do
        block ? block.call(@browser) : @browser.span(identifier)
      end
    end

    # adds a method that returns the content of a <p>
    # and another method that returns the div element
    def p name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_p").text
      end
      define_method("#{name}_p") do
        block ? block.call(@browser) : @browser.p(identifier)
      end
    end

    # adds a method that returns the content of a <dd>
    # and another method that returns the dd element
    def dd name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_dd").text
      end
      define_method("#{name}_dd") do
        block ? block.call(@browser) : @browser.dd(identifier)
      end
    end

    # adds a method that returns the content of a <dl>
    # and another that returns the dl element
    def dl name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_dl").text
      end
      define_method("#{name}_dl") do
        block ? block.call(@browser) : @browser.dl(identifier)
      end
    end

    # adds a method that returns the content of a <dt>
    # and another that returns the dt element
    def dt name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_dt").text
      end
      define_method("#{name}_dt") do
        block ? block.call(@browser) : @browser.dt(identifier)
      end
    end

    # adds a method that returns the content of a
    # <form> element and another that returns the
    # form element
    def form name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_form").text
      end
      define_method("#{name}_form") do
        block ? block.call(@browser) : @browser.form(identifier)
      end
    end

    # adds a method that returns a the content of a
    # <frame> element and another that returns the
    # frame element
    def frame name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_frame").text
      end
      define_method("#{name}_frame")  do
        block ? block.call(@browser) : @browser.frame(identifier)
      end
    end

    # adds a method that returns an image <image> element
    def image name, identifier=nil, &block
      define_method(name) do
        block ? block.call(@browser) : @browser.image(identifier)
      end
    end

    # adds a method that returns the content of an li
    # and another method that returns the li element
    def li name, identifier=nil, &block
      define_method name do
        self.send("#{name}_li").text
      end
      define_method "#{name}_li" do
        block ? block.call(@browser) : @browser.li(identifier)
      end
    end

    # adds a method that returns the content of an h1
    # and another method that returns the h1 element
    def h1 name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_h1").text
      end
      define_method("#{name}_h1") do
        block ? block.call(@browser) : @browser.h1(identifier)
      end
    end

    # adds a method that returns the content of an h2
    # and another method that returns the h1 element
    def h2 name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_h2").text
      end
      define_method("#{name}_h2") do
        block ? block.call(@browser) : @browser.h2(identifier)
      end
    end

    # adds a method that returns the content of an h3
    # and another method that returns the h3 element
    def h3 name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_h3").text
      end
      define_method("#{name}_h3") do
        block ? block.call(@browser) : @browser.h3(identifier)
      end
    end

    # adds a method that returns the content of an h4
    # and another method that returns the h4 element
    def h4 name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_h4").text
      end
      define_method("#{name}_h4") do
        block ? block.call(@browser) : @browser.h4(identifier)
      end
    end

    # adds a method that returns the content of an h5
    # and another method that returns the h5 element
    def h5 name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_h5").text
      end
      define_method("#{name}_h5") do
        block ? block.call(@browser) : @browser.h5(identifier)
      end
    end

    # adds a method that returns the content of an h6
    # and another method that returns the h6 element
    def h6 name, identifier=nil, &block
      define_method(name) do
         self.send("#{name}_h6").text
      end
      define_method("#{name}_h6") do
        block ? block.call(@browser) : @browser.h6(identifier)
      end
    end
  end
end