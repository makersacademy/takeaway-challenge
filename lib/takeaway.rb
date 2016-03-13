require_relative 'basket'
require_relative 'menu'
require 'rubygems'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Takeaway

  attr_reader :basket, :menu

  def initialize(basket_class=Basket, menu_class=Menu)
    @basket = basket_class.new
    @menu = menu_class.new
  end

  def add(dish, qty=1)
    @basket.add(priced_dish(dish, qty))
  end

  def remove(dish, qty=1)
    @basket.remove(priced_dish(dish, qty))
  end

  def place_order(total)
    actual_total = @basket.calc_total
    raise 'Re-calculate and enter correct total' unless total == actual_total
    confirm_order
  end

  private

  def priced_dish(dish, qty)
    price = @menu.find_price(dish)
    priced_dish = {name: dish, amount: qty, price: price}
  end

  def confirm_order
    @client = Twilio::REST::Client.new ENV['SID'], ENV['TOKEN']
    @client.messages.create(
      from: ENV['FROM'],
      to: ENV['MY_NUMBER'],
      body: "Thank you! Your order was placed and will be delivered before #{Time.now.hour + 1}:#{Time.now.min}"
    )
    'Confirmation text sent'
  end
end
