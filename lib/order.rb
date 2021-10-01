class Order
  attr_reader :selected_items
  def initialize(menu = Menu.new)
    @selected_items = []
    @menu = menu
    @total = 0
  end
  def display_menu
    @menu.dishes.each_with_index { |dish, index| puts "#{index + 1}. #{dish[:name]} £#{dish[:price]}"}
  end
  def add_order_item(dish_number, quantity = 1)
    dish_index = dish_number - 1
    quantity.times {@selected_items << @menu.dishes[dish_index]}
  end
  def check_total
    @selected_items.each{ |item| @total += item[:price] }
    @total
  end
  def submit_order
    check_total
  end
end