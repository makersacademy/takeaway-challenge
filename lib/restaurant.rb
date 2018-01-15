require_relative 'secrets'
require 'twilio-ruby'

class Restaurant

  attr_reader :basket

  def initialize
    @menu = { 'spring rolls' => 1.99, 'prawn toast' => 1.99,
       'egg fried rice' => 2.50, 'kung po chicken' => 4.50 }
    @basket = {}
    @secrets = Secrets.new
  end

  def read_menu
    @menu
  end

  def order(dish, quantity = 1)
    @basket[dish] = quantity
  end

  def order_summary
    dish_summary + "\nTotal is £#{"%.2f" % basket_total}"
  end

  def check_total(user_total)
    user_total == basket_total
  end

  def confirm_order
    send_message("Thank you for your order. Your food will be delivered by #{estimate_time}")
  end

  private

  def dish_summary
    @basket.map { |dish, quantity|
      "#{quantity} x #{dish.capitalize} -- " +
      "£#{"%.2f" % subtotal(dish, quantity)}"
    }.join("\n")
  end

  def send_message(message)
    Twilio::REST::Client.new(@secrets.account, @secrets.token).messages.create(
      from: @secrets.twilio_phone,
      to: @secrets.destination,
      body: message
      )
  end

  def estimate_time
    delivery_time = Time.now + 1800
    delivery_time.strftime("%H:%M")
  end

  def subtotal(dish, quantity)
    @menu[dish] * quantity
  end

  def basket_total
    @basket.map { |dish, quantity| @menu[dish] * quantity }.sum
  end
end
