# build order
# read available options
# compare total
# submit order

require_relative 'menu'
require_relative 'order'
require 'twilio-ruby'
require 'envyable'
Envyable.load('./config/env.yml', 'development')

class TakeAway

  attr_reader :menu, :new_order, :message, :total

def initialize(menu = Menu.new)
  @menu = menu
  @new_order = Order.new(menu)
end

  def show_menu
    menu.dishes.each { |key, value| puts "#{key}.........£#{value}" }
  end

  def add(dish, quantity=1)
    self.new_order.add(dish, quantity)
    "#{quantity}x #{dish} added to your basket"
  end

  def checkout(total)
    if price_match?(total)
      # calculate_total
      "Thank you for your order, Total: £#{total}"
      # send_text("Thank you for your order: £#{total}")
    else
      "Price doesn't match total"
    end
  end


  #TODO currently in test
  # Twilo api
  def send_text(message)

    to = params["to"]
    message = params["body"]
    client = Twilio::REST::Client.new(
    ENV["TWILIO_ACCOUNT_SID"],
    ENV["TWILIO_AUTH_TOKEN"]
    )

    client.message.create(
      to: to,
      from: "Takeaway",
      body: message
    )
  end


  private

  attr_writer :menu, :new_order

  def price_match?(total)
    total.to_f == self.new_order.total_price
  end


end


# Notes
# was in add
# self.item = {:dish => dish, :quantity => quantity }
# self.basket << [menu.dishes[dish]]
# self.total_price += self.menu.dishes[dish] * quantity
