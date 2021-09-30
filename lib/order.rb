class Order
  attr_reader :selected_items
  def initialize(menu = Menu.new)
    @selected_items = []
    @menu = menu
    @total = 0
  end
  def display_menu
    @menu.dishes.each_with_index { |dish, index| puts "#{index + 1}. #{dish[0]} £#{dish[1]}"}
  end
  def add_order_item(dish_number)
    dish_index = dish_number - 1
    @selected_items << @menu.dishes[dish_index]
  end
  def check_total
    @selected_items.each{ |item| @total += item[1] }
    @total
  end
end