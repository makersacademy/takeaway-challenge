class Order
  attr_accessor :selected_dishes

  def initialize
    @selected_dishes = Array.new
  end

  def add(dish, quantity = 1)
    name = Menu::DISHES[dish - 1][:name]
    line_total = quantity * Menu::DISHES[dish - 1][:price]
    @selected_dishes << { quantity: quantity, dish: name, subtotal: line_total }
    puts "#{quantity}x #{name} added to your order"
  end
end
