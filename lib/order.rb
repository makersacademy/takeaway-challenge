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


  def total
    option_total.inject(:+)
  end

  private

  def option_total
    options.collect do |option, quantity|
      menu.price(option) * quantity
    end
  end

end

class NoOptionError < StandardError; end
