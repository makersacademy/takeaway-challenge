require_relative 'dish'

class Customer

  DEFAULT_NUMBER = '+447930904641'

  attr_reader :phone_number
  attr_accessor :order

  def initialize(phone_number= DEFAULT_NUMBER)
    @phone_number = phone_number
    @order = nil
  end

  def create_order_from(menu, new_order)
    @order = new_order
    menu.display
    print_select_item_msg
    add_items_to_order_from(menu)
  end

  def send_order_to(restaurant)
    restaurant.receive_order(customer.order, customer)
  end

  def add_items_to_order_from(menu)
    loop do
      dish = select_dish_from(menu)
      break if dish.empty?
      quantity = select_quantity_from(menu)
      add_item_to_order_from(menu, dish, quantity)
    end
  end

  def add_item_to_order_from(menu, dish, quantity)
    @order.add(Dish.new(dish, menu.lookup_price(dish)), quantity) if valid_item?(menu, dish)
  end

  def valid_item?(menu, dish)
    return false unless menu.contains?(dish)
    true
  end

  def select_dish_from(menu)
    print_select_dish_msg
    get_input
  end

  def select_quantity_from(menu)
    print_update_quantity_msg
    get_input.to_i
  end

  def print_select_item_msg
    puts "Item selection - hit enter twice to finish"
  end

  def print_select_dish_msg
    puts "Please select a dish"
  end

  def print_update_quantity_msg
    puts "How many would you like?"
  end

  def get_input(input = STDIN)
    input.gets.chomp
  end

  def customer
    self
  end

end