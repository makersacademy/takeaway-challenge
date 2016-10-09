require_relative 'takeaway'
require_relative 'menu'
require_relative 'user'
require 'rubygems'
require 'twilio-ruby'


class Restaurant

attr_reader :takeaway_order, :menu_items, :print_order, :customer

  def initialize
    @menu_items = [{name: "Beef Dipped in Vinegar", price: 5},
    {name: "Classic Silky Vietnamese Sausage", price: 6},
    {name: "Fermented Pork Sausage", price: 4},
    {name: "Fried Spring (Imperial) Rolls", price: 5},
    {name: "Grilled Sugarcane Shrimp", price: 7},
    {name: "Shredded Pork Salad Rolls", price: 8},
    {name:  "Toasted Dried Squid", price: 9},
    {name:  "Salad Rolls Rice Paper", price: 3}]
    @takeaway_order = []
    @total_price = 0
  end


  def print_menu
    count = 1
    puts "Welcome to Vietnoms!"
    @menu_items.each do |item|
    puts "#{count} #{item[:name]} - £#{item[:price]}"
    count += 1
    end
  end

  def add_item_number_to_order(num)
    @takeaway_order << @menu_items[num - 1]
  end

  def print_order
    count = 1
    puts "Your order is:"
      @takeaway_order.each do |item|
        puts "#{count} #{item[:name]} - £#{item[:price]}"
        count += 1
      end
    calculates_price
    puts "Your order total comes to £#{@total_price}"
  end

  def complete_order(expected_number_of_dishes)
    fail "We do not appear to have the correct number of dishes." if expected_number_of_dishes != takeaway_order.length
    send_sms
  end

  def clears_order
    @takeaway_order = []
  end


def send_sms
  account_sid = 'AC8132f92d2bdc365339186ca2d6f46225'
  auth_token = '920dfb649573f2bc4b854f12e0e7f93b'
  client = Twilio::REST::Client.new account_sid, auth_token

  from = "+441202286077" # Your Twilio number

  customer = {
  "+447411252150" => "Rachael",
   }
   
  customer.each do |key, value|
    client.account.messages.create(
      :from => from,
      :to => key,
        :body => "Hello Rachael, your order has been completed and should be with you shortly"
      )
      puts "Sent message to Rachael"
    end
  end


private

  def calculates_price
    @takeaway_order.each do |item|
      @total_price += item[:price]
    end
  end

end
