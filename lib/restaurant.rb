require_relative 'list'
require_relative 'sms_sender'

class Restaurant

  include SMSSender

  def initialize(menu = "takeawaylist.csv")
    @menu = List.new(menu)
  end

  def view_menu
    menu.print_menu
  end

  def make_order(user_input)
    order = user_input.split(/, /)
    check_input_formatting(order)
    check_items_are_on_menu(order, menu)
    check_order_total(order)
    confirm_delivery
  end

  private

  attr_reader :menu, :user_input

  def check_input_formatting(order)
    order[0..-2].each do |menu_item|
      raise RuntimeError, "Input formatted incorrectly" unless /[A-Za-z ]+ x\d+/ =~ menu_item
    end
    raise RuntimeError, "Input formatted incorrectly" unless /\A\$\d+/. =~ order[-1]
  end

  def check_items_are_on_menu(order, menu)
    order_item_names = return_item_names_from_order(order)
    order_item_names.each do |name|
      unless menu.names_of_items.include?(name)
        raise RuntimeError, "Item entered that is not listed on menu"
      end
    end
  end 

  def check_order_total(order)
    cost_entered = order[-1].scan(/\d+/)[0].to_i
    item_names_and_quantities = return_item_names_and_quantities(order)
    actual_cost = calculate_actual_cost(item_names_and_quantities, menu)
    raise RuntimeError, "Incorrect order price entered" unless actual_cost == cost_entered 
  end

  def return_item_names_from_order(order)
    order[0..-2].collect { |menu_item| menu_item =~ /([A-Za-z ]+(?= x\d+))/; $1 }
  end

  def return_item_names_and_quantities(order)
    order[0..-2].collect do |menu_item|
      menu_item =~ /([A-Za-z ]+(?= x(\d+)))/; { name: $1, quantity: $2 } 
    end
  end

  def calculate_actual_cost(item_names_and_quantities, menu)
    cost_grouped_by_menu_item = return_cost_grouped_by_menu_item(item_names_and_quantities, menu)
    costs = cost_grouped_by_menu_item
    costs.delete(nil)
    costs.reduce(&:+)
  end

  def return_cost_grouped_by_menu_item(item_names_and_quantities, menu)
    item_costs = item_names_and_quantities.collect do |order|
      menu.menu_items.collect do |menu_item|
        menu_item.price * order[:quantity].to_i if menu_item.name == order[:name]
      end
    end
    item_costs.flatten!
  end

  def confirm_delivery
    sender = ENV["TWILIO_PHONE_NUMBER"]
    receiver = ENV["MY_PHONE_NUMBER"]
    delivery_time = print_time(current_time_plus_one_hour)
    message = "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    send_sms(sender, receiver, message)
  end

  def print_time(time)
    hour = time.hour == 23 ? 0 : time.hour
    minute = time.min < 10 ? "0#{time.min}" : time.min
    "#{hour}:#{minute}"
  end

  def current_time_plus_one_hour
    Time.new + 3600
  end

end
