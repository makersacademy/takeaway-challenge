class Waiter

  def initialize(restaurant)
    self.restaurant = restaurant
  end

  def select_items(user_input)
    user_input = user_input.split(/, /)
    check_input_formatting(user_input)
    check_items_are_on_menu(user_input)
    check_order_total(user_input)
    send_sms
  end

  private
  
  attr_accessor :user_input
  attr_reader :restaurant

  def check_input_formatting(user_input)
    user_input[0..-2].each do |menu_item|
      raise RuntimeError, "Input formatted incorrectly" unless /[A-Za-z ]+ x\d+/ =~ menu_item
    end
    raise RuntimeError, "Input formatted incorrectly" unless /\A\$\d+/. =~ user_input[-1]
  end

  def check_items_are_on_menu(user_input)
    order_item_names = return_order_item_names_from_user_input(user_input)
    order_item_names.each do |name|
      unless names_of_items_on_menu.include?(name)
        raise RuntimeError, "Item entered that is not listed on menu"
      end
    end
  end 

  def check_order_total(user_input)
    cost_entered = user_input[-1].scan(/\d+/)[0].to_i
    order_item_names_and_quantities = return_order_item_names_and_quantities(user_input)
    actual_cost = calculate_actual_cost(order_item_names_and_quantities)
    raise RuntimeError, "Incorrect order price entered" unless actual_cost == cost_entered 
  end

  def return_order_item_names_from_user_input(user_input)
    user_input[0..-2].collect { |menu_item| menu_item =~ /([A-Za-z ]+(?= x\d+))/; $1 }
  end

  def names_of_items_on_menu
    menu_items.collect { |menu_item| menu_item.name }
  end

  def return_order_item_names_and_quantities(user_input)
    user_input[0..-2].collect do |menu_item|
      menu_item =~ /([A-Za-z ]+(?= x(\d+)))/; { name: $1, quantity: $2 } 
    end
  end

  def calculate_actual_cost(order_item_names_and_quantities)
    cost_grouped_by_menu_item = return_cost_grouped_by_menu_item(order_item_names_and_quantities)
    costs = cost_grouped_by_menu_item
    costs.delete(nil)
    costs.reduce(&:+)
  end

  def return_cost_grouped_by_menu_item(order_item_names_and_quantities)
    item_costs = order_item_names_and_quantities.collect do |order|
      menu_items.collect do |menu_item|
        menu_item.price * order[:quantity].to_i if menu_item.name == order[:name]
      end
    end
    item_costs.flatten!
  end

  def send_sms
    delivery_time = print_time(current_time_plus_one_hour)
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]

    client = Twilio::REST::Client.new(account_sid, auth_token)

    client.account.messages.create(
      to: ENV["MY_PHONE_NUMBER"],
      from: ENV["TWILIO_PHONE_NUMBER"],
      body: "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    )
  end

  def current_time_plus_one_hour
    Time.new + 3600
  end

  def print_time(time)
    hour = time.hour == 23 ? 0 : time.hour
    minute = time.min < 10 ? "0#{time.min}" : time.min
    "#{hour}:#{minute}"
  end

end
