require_relative 'secrets'

class Restaurant

  attr_reader :basket

  def initialize
    @menu = { 'spring rolls' => 1.99, 'prawn toast' => 1.99,
       'egg fried rice' => 2.50, 'kung po chicken' => 4.50 }
    @basket = {}
  end

  def read_menu
    @menu
  end

  def order(dish, quantity = 1)
    @basket[dish] = quantity
  end

  def order_summary
    dish_summary + "\nTotal is £#{basket_total}"
  end

  def confirm_order
    send_message("Thank you for your order.")
  end

  private

  def dish_summary
    @basket.map { |dish, quantity|
      "#{quantity} x #{dish.capitalize} -- " +
      "£#{subtotal(dish, quantity)}"
    }.join("\n")
  end

  def send_message(message)
    Twilio::REST::Client.new(secrets.account, secrets.token)
      .messages.create(
        from: secrets.twilio_phone,
        to: secrets.destination,
        body: message
      )
  end

  def subtotal(dish, quantity)
    @menu[dish] * quantity
  end

  def basket_total
    @basket.map { |dish, quantity| @menu[dish] * quantity }.sum
  end
end
