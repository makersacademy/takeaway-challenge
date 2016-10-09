class Order

  attr_reader :options, :menu

  def initialize(menu)
    @options = Hash.new(0)
    @menu = menu
  end


  def add(option, quantity)
    fail NoOptionError, "#{option.capitalize} is not on the menu." unless menu.has_option?(option)
    options[option] += quantity
  end

end

class NoOptionError < StandardError; end
