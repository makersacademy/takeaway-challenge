require_relative 'menu'

class Order

attr_reader :order

  def initialize

    @order = []


  end

  def add_menu_item_to_order(item, number=1)
    @order << [item, number, number *item.price]
  end

  def total_dishes
  total_dishes = []
  order.each do |item|
    total_dishes <<item[1]
  end
  total_dishes.inject(:+)
  end



  def total
    total = []
    order.each do |item|
      total<<item[2]
    end
    total.inject(:+)

  end



end

curry = Menu_item.new("Curry",5)
burger = Menu_item.new("Burger",6)
p curry
p burger
menu = Menu.new
p menu
menu.add_item(curry)
menu.add_item(burger)
p menu
order = Order.new
p order
order.add_menu_item_to_order(curry)
order.add_menu_item_to_order(burger)
puts
p order
p order.total_dishes
