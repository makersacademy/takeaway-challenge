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

  def summary
    summary_format.join(", ")
  end

  def sum
    prices = []
    @basket.each { |item, quant| prices << @menu.display[item] * quant }
    prices.inject(:+)
  end

  private

  def available?(item)
    @menu.display.include? item
  end

  def confirm_addition
    "#{basket.values.last}x #{basket.keys.last}(s) added to your basket."
  end

  def summary_format
    items = []
    @basket.each do |item, quant|
      items << "#{item} x#{quant} = £#{@menu.display[item] * quant}"
    end
    items
  end
end
