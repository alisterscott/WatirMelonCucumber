module PageMixIn
  attr_accessor :search_field

  def initialize *args, &block
    @search_field = self.text_field(:name => "q")
  end

  def method_missing sym, *args, &block
    @browser.send sym, *args, &block
  end
end