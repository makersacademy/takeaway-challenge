# This is the main class of the program
# It allows a customer to look, decide, and place orders from a menu

class Customer

  attr_reader :order

  def initialize(text = SmsText.new)
    @order = Order.new  # Creates an order class upon init
    @sms = text         # Links Twilio functionalitry to customer
  end

  def check_menu(menu)
    menu_list(menu) # gives an array of menu dishes
  end

  def select_dish(menu, dish, num)
    import_dish(menu, dish, num) # adds menu.find dish to order.order num times
    print_added(dish, num)       # prints out dish add confirmation
  end

  def verify_order
    @order.print_list # returns an array of string dishes and prices
  end

  def total_balance
    @order.total # returns total cost of the order
  end

  def place_order
    @sms.send_text # Sends con_list to Twilio function
  end

  private

  # Iterates a inputed number of times
  # pushes menu.find_dish(Dish class) to the order array in order
  def import_dish(menu, dish, num)
    num.times do
      @order.order << menu.find_dish(dish)
    end
  end

  # Prints the added confirmation message
  def print_added(dish, num)
    "#{num} #{dish} added" if @order.added?
  end

  # uses the menu.list funtion if menu
  def menu_list(menu)
    menu.list_dishes if menu.is_a?(Menu)
  end
end
