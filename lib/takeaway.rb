class TakeAway

require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'


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

  def place_order(items={})
    items.each do |dish, quantity|
      raise "#{dish.capitalize} is not on the menu." unless menu.include?(dish)
      order["#{dish} x #{quantity}"] = total_cost_per_item(menu[dish], quantity)
    end
  end

  def show_order
    order
  end

  def total_cost_per_item(price, quantity)
    price_in_pence = ((price * 100).round * quantity)
    prices << price_in_pence
    "%.2f" % (price_in_pence / 100.0)
  end

  def delete_from_order(dish, quantity)
    order.delete("#{dish} x #{quantity}")
  end

  def grand_total
    total_in_pence = prices.inject(:+)
    "%.2f" % (total_in_pence / 100.0)
  end

  def confirm_order
    puts "Please confirm that your order is correct by typing Y for Yes or N for No."
    show_order
    confirmation = gets.chomp
    if confirmation == "Y"
      delivery_time = Time.new + 3600
      send_message(delivery_time)
    else
      "Please edit your order."
    end
  end

  def send_message(delivery_time)
    account_sid = 'ACd18bfc872e98296bfd513c3537d79945'
    auth_token = 'bb86f5ef30b2e093ec06255279f7ece8'
    @client = Twilio::REST::Client.new account_sid, auth_token
      @client.account.messages.create({
      :from => '+441698313072',
      :to => '+447761239717',
      :body => "Thank you! Your order was placed and will be delivered before #{delivery_time.hour}:#{delivery_time.min}"
  })
  end
end

