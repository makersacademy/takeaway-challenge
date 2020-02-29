require 'menu'

class Order
  attr_reader :total, :items
  def initialize(menu = Menu.new)
    @menu = menu
    @total = 0
    @items = Hash.new(0)
  end

  def view_menu
    @menu.list
  end

  def view_order
    @items
  end

  def availability(name)
    @menu.available?(name)
  end

  def add_dish(dish, quantity = 1)
    @items[dish] += quantity
  end

  def total_price
    @items.each do |name, quantity|
      @total += @menu.price(name) * quantity
    end
    @total
  end
end
