require_relative "menu"

class Order
  attr_reader :basket
  UNAVAIABLE_ERROR = "Item not available.".freeze

  def initialize(menu)
    @menu = menu
    @basket = Hash.new(0)
  end

  def add(item, quantity = 1)
    fail UNAVAIABLE_ERROR unless available?(item)
    @basket[item] += quantity
    confirm_addition
  end

  def confirm_addition
    "#{basket.values.last}x #{basket.keys.last}(s) added to your basket."
  end

  def sum
    prices = []
    @basket.each { |item, quant| prices << (@menu.display[item] * quant) }
    prices.inject(:+).round(2)
  end

  private
    def available?(item)
      @menu.display.include? item
    end
end
