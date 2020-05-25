require_relative 'dishes'

class Select
  attr_reader :menu, :basket, :total

  def initialize(menu = Dishes.new)
    @menu = menu
    @basket = Hash.new
  end

  def order(item, quantity = 1)
    @basket[item] = quantity
  end

  def order_overview
    @basket.each do |k, v|
      @total = @menu.menu[k] * v
    end
    @total
  end
end