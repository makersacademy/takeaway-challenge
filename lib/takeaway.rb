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

  def show_menu
    menu
  end

  def place_order(items = {})
    items.each do |dish, quantity|
      raise "#{dish.capitalize} is not on the menu." unless menu.include?(dish)
      order["#{dish} x #{quantity}"] = total_cost_per_item(menu[dish], quantity)
    end
  end

  def grand_total
    total_in_pence = prices.inject(:+)
    "%.2f" % (total_in_pence / 100.0)
  end

  def total_cost_per_item(price, quantity)
    price_in_pence = ((price * 100).round * quantity)
    prices << price_in_pence
    "%.2f" % (price_in_pence / 100.0)
  end

  def show_order
    order_output = print_order_items
    order_output += "Total: £#{grand_total}"
    order_output
  end

  def delete_from_order(dish, quantity)
    order.delete("#{dish} x #{quantity}")
  end

  def confirm_order
    puts "Please confirm that your order is correct by typing Y for Yes or N for No."
    puts show_order
    confirmation = gets.chomp
    delivery_time = Time.new + 3600
    confirmation == "Y" ? send_message(delivery_time) : "Please edit your order."
  end

  private

  def print_order_items
    order_output = ""
    order.each { |item, price| order_output += "#{item}: £#{price}, " }
    order_output
  end

  def send_message(delivery_time)
    account_sid = 'ACd18bfc872e98296bfd513c3537d79945'
    auth_token = 'bb86f5ef30b2e093ec06255279f7ece8'
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create(
      from: '+441698313072',
      to: '+447761239717',
      body: "Thank you! Your order was placed and will be delivered before #{delivery_timhour}:#{delivery_time.min}"
                                      )
  end
end

