require_relative 'order.rb'

class Takeaway
MENU = { "Margarita" => 12,
"The special" => 18,
"Chicago classic"  => 18,
"Meat & more meat" => 19,
"Fresh spinach" => 14,
"Super veggie" => 18,
"Bacon bbq chicken" => 18,
"Chicken sausage deluxe" => 18,}

attr_reader :menu,:order

  def initialize
    @menu = MENU
    @order = Order.new
  end

  def add_food(item)
    message = ("Sorry, that item isn't on the menu")
    raise message if !on_menu?(item)
    @order.list[item] == nil ? @order.list[item] = 1 : @order.list[item] += 1
  end

  def on_menu?(item)
    @menu.has_key?(item)
  end

end
