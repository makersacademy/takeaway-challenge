require_relative 'menu.rb'

class Order
  attr_accessor :menu, :dish_order

  def initialize(menu = Menu.new)
    @dish_order = {}
    @menu = menu
  end

  def add(meal, quantity = 1)
    fail "There is no such dish" unless @menu.has_dish(meal)
    @dish_order[meal] = quantity
  end

  def total
    # reduce the hash to get full price
    "£%.2f" % [order_total.reduce(:+)]
  end

  private

  attr_reader :menu

  def order_total
    @dish_order.map do |item, quantity|
       @menu.price(item) * quantity
    end
  end

end
