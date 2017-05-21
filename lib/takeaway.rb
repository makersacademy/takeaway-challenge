class Takeaway
  attr_reader :current_order

  def initialize(menu_class = Menu)
    @menu = menu_class.new
    @current_order = nil
  end

  def read_menu
    list_of_food = {}
    @menu.dishes.each { |dish| list_of_food[dish.name] = dish.price }
    list_of_food
  end

  def select_dish(selected_dish)
    current_order.add_dish(@menu.find_dish(selected_dish))
  end

  def current_order
    @current_order ||= Order.new
  end

  def show_order
    current_order.dishes.each_with_index do |dish, index|
      puts "#{index + 1}. #{dish.name}, £#{dish.price}"
    end
    puts "Total: £#{current_order.total_price}"
  end

  def place_order
    
  end

end
