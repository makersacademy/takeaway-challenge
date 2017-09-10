require_relative 'menu'
require 'twilio-ruby'

class Cart
  attr_reader :basket, :menu

  def initialize(basket = Hash.new(0))
    @basket = basket
    @menu = Menu.new
  end

  def order(dish, quantity = 1)
    raise 'Item unavailable' unless menu.dishes.include?(dish)
    @basket[dish] += quantity
    p "#{quantity}x #{dish}(s) added to your basket"
  end

  def total_price
    total = 0
    basket.each do |dish, quantity|
      total += (quantity * menu.price(dish))
    end
    total
  end

  def checkout(price)
    raise 'Incorrect total price' if price != total_price
    send_text
    "Checkout for $#{'%.2f' % total_price} successful. You will receive a text shortly."
    basket = Hash.new(0)
  end

  private

  def send_text
    account_sid = 'ACc1b7bd40884f6b9d0de29c8b819e85cd'
    auth_token = '123456789'
    client = Twilio::REST::Client.new account_sid, auth_token
    client.messages.create({
      :from => '+441706300291',
      :to =>  '123456789',
      :body => 'Your order will arrive in 1 hour'
      })
  end
end
