# knows how to handle an order
require './docs/menu'

class Order

  attr_reader :menu, :basket
  attr_accessor :total


  def initialize(menu = MENU)
    @menu = menu
    @basket = Hash.new(0)
    @total = 0
  end

  def add(item, n = 1)
    raise "Item is not on the menu" unless available?(item)
    @basket[item] += n
  end

  def calc_total
    @basket.each do |item, n|
    @total += n * @menu[item]
    end
    total
  end

private

  def available?(item)
    @menu.has_key?(item)
  end

end
