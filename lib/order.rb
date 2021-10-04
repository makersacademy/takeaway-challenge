class Order
  attr_reader :selected_items
  def initialize(menu_class = Menu, dish_class = Dish, confirmation_class = Confirmation)
    @selected_items = []
    @menu = menu_class.new([dish_class.new("chips", 1.50), dish_class.new("nuggets", 2.00),
    dish_class.new("big mac", 3.50), dish_class.new("apple pie", 0.75)])
    @total = 0
    @confirmation_class = confirmation_class
  end
  def display_menu
    @menu.dishes.each_with_index { |dish, index| puts "#{index + 1}. #{dish.name} £#{dish.price}"}
  end
  def add_order_item(dish_number, quantity = 1)
    raise ("This is not a menu item! Please pick something from our menu!") unless dish_number.is_a?(Integer)
    raise ("This is not a menu item! Please pick something from our menu!") unless dish_number <= @menu.dishes.length
    dish_index = dish_number - 1
    quantity.times {@selected_items << @menu.dishes[dish_index]}
  end
  def check_total
    raise ("You haven't ordered anything yet!") if empty_order?
    @selected_items.each{ |item| @total += item.price}
    @total
  end
  def submit_order
    check_total
    confirmation = @confirmation_class.new()
    confirmation.send_confirmation
  end
  def empty_order?
    @selected_items.empty? ? true : false
  end
end