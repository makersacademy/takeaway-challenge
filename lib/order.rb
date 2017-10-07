# new class 'Order'
require './lib/menu'
require 'twilio-ruby'

class Order
  attr_reader :basket

  def initialize(menu = Menu.new)
    @basket = []
    @menu = menu
  end

  def add(item, quantity = 1)
    fail "Please enter a valid food selection!" unless @menu.menu_items.include?(item)
    fail "Please enter a valid number of items!" unless quantity >= 1
    quantity.times { @basket << item }
  end

  def cost
    total_cost = 0
    @basket.each do |item|
      total_cost += @menu.menu_items[item]
    end
    total_cost
  end

  def display_order
    current_order = "#{@basket.count} items in your order:\n"
    @basket.each do |item|
      current_order += "#{item} : £#{@menu.menu_items[item]}\n"
    end
    current_order += "Total Cost £#{cost}"
  end

  def place_order
    delivery_time = Time.now + (60 * 60)
    current_order = "#{display_order}\n"
    current_order += delivery_time.strftime("Your order will arrive at %I:%M%p")
    text_order(current_order)
    current_order
  end

  def text_order(order_details)
    account_sid = 'ACd00a806679c1169c47a3950e956df159'
    auth_token = '5cdca75a737497e87715e0ff774d18e2'

    client = Twilio::REST::Client.new account_sid, auth_token

    client.messages.create({
      :from => '+441143033372',
      :to => '+447773793569',
      :body => order_details,
    })
  end
end
