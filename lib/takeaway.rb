require 'twilio-ruby'

class TakeAway
  SECRET_KEY = ENV['TWILIO_AUTH_TOKEN']

  attr_reader :menu
  attr_accessor :order

  def initialize
    @order = {}
  end

  def add_menu(menu)
    @menu = menu.dishes
  end

  def place_order(items = {})
    items.each do |dish, quantity|
      raise "#{dish.capitalize} is not on the menu." unless menu.include?(dish)
      item_already_ordered?(dish) ? change_item_quantity(dish, quantity) : order["#{dish}"] = quantity
    end
  end

  def item_already_ordered?(item)
    order.include?(item)
  end

  def change_item_quantity(item, quantity)
    current_quantity = order[item]
    order[item] = current_quantity + quantity
  end

  def grand_total
    total_in_pence = order.inject(0) { |total, (item, quantity)| total + total_cost_per_item(item, quantity) }
    "%.2f" % (total_in_pence / 100.0)
  end

  def total_cost_per_item(item, quantity)
    price_in_pence = ((menu[item] * 100).round * quantity)
  end

  def show_order
    order_output = print_order_items_with_cost
    order_output += "Total: £#{grand_total}"
  end

  def delete_from_order(item, quantity)
    new_quantity = order[item] - quantity
    order.delete("#{item}")
    order[item] = new_quantity if new_quantity > 0
  end

  def confirm_order(phone_number)
    puts "Please confirm that your order is correct by typing Y for Yes or N for No."
    puts show_order
    confirmation = gets.chomp
    delivery_time = Time.new + 3600
    confirmation == "Y" ? send_message(delivery_time, phone_number) : "Please edit your order."
  end

  private

  def print_order_items_with_cost
    order.inject("") do |order_str, (item, quantity)|
      price_in_pence = total_cost_per_item(item, quantity)
      order_str + "#{item} x #{quantity}: £%.2f, " % (price_in_pence / 100.0)
    end
  end

  def send_message(delivery_time, phone_number)
    account_sid = 'ACd18bfc872e98296bfd513c3537d79945'
    auth_token = SECRET_KEY
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create(
      from: '+441698313072',
      to: phone_number,
      body: "Thank you! Your order was placed and will be delivered before #{delivery_time.hour}:#{delivery_time.min}"                                 )
  end

  def bananas
    (__method__).to_s
  end
end

