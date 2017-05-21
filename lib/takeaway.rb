class Takeaway
  attr_reader :current_order

  def initialize(menu_class = Menu, notifier_class = Notifier)
    @menu = menu_class.new
    @current_order = nil
    @notifier = notifier_class.new
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

  def place_order(total)
    raise 'Order total is not correct' if current_order.total_price != total
    @notifier.send('Thank you!')
  end

end
