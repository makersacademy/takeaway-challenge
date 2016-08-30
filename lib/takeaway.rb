require_relative 'menu'
require_relative 'basket'
require 'twilio-ruby'


class Takeaway

  attr_reader :menu, :basket, :client, :value

  def initialize(menu_class: Menu, basket_class: Basket)
    account_sid = 'AC12d01149261711dee5f82c38258f1ea4'
    auth_token = '59b03d096a46f98f3d10596bfc6ee7e0'

    @menu = menu_class.new
    @basket = basket_class.new
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def show_menu
    puts @menu.list

  end

  def add_to_basket(item, qty=1)
    fail "Item not on menu" unless check_item(item)
     @basket.add_item(item, @menu.list[item], qty)
     puts "#{qty} #{item} added to your order"
  end

  def check_item(item)
    @menu.list.has_key? item
  end

  def total
    @value = @basket.sum.round(2)
    puts "Your total order cost is £#{value}"
  end

  def place_order(payment)
    fail "Payment incorrect" unless check_payment(payment)
    @client.messages.create(
  from: '+441530382051',
  to: '+447943961785',
  body: "Your order for £#{value}, has been placed and will arrive before #{Time.new + 1*60*60} " )
  end

  def check_payment(payment)
    payment == @value
  end
end
