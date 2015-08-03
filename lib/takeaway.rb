require 'twilio-ruby'

class TakeAway

  attr_reader :menu
  attr_accessor :order, :prices

  def initialize
    @order = {}
    @prices = []
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
    true if order.include?(item)
  end

  def change_item_quantity(item, quantity)
    current_quantity = order[item]
    order[item] = current_quantity + quantity
  end


  def grand_total
    total_in_pence = prices.inject(:+)
    "%.2f" % (total_in_pence / 100.0)
  end

  def total_cost_per_item(item, quantity)
    price_in_pence = ((menu[item] * 100).round * quantity)
    prices << price_in_pence
    "%.2f" % (price_in_pence / 100.0)
  end

  def show_order
    order_output = print_order_items_with_cost
    order_output += "Total: £#{grand_total}"
  end

  def delete_from_order(item, quantity)
    if quantity = order[item]
      order.delete("#{item}")
    else
      new_quantity = order[item] - quantity
      order[item] = new_quantity
    end
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
    order_output = ""
    order.each do |item, quantity|
      price = total_cost_per_item(item, quantity)
      order_output += "#{item} x #{quantity}: £#{price}, "
    end
    order_output
  end

  def send_message(delivery_time, phone_number)
    account_sid = 'ACd18bfc872e98296bfd513c3537d79945'
    auth_token = 'bb86f5ef30b2e093ec06255279f7ece8'
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create(
      from: '+441698313072',
      to: phonenumber,
      body: "Thank you! Your order was placed and will be delivered before #{delivery_time.hour}:#{delivery_time.min}"
                                      )
  end
end

