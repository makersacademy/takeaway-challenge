require 'twilio-ruby'
require_relative 'twilio'
class Takeaway

  attr_reader :dishes, :current_order, :print_current_order,:client


  def initialize
    @dishes = [
      {name: "Cheese & Tomato", price:  14.99},
      {name: "Mighty Meaty", price:  14.99},
      {name: "Pepperoni Passion", price:  16.99},
      {name: "Texas BBQ", price:  17.99},
      {name: "Vegi Supreme", price:  15.99},
      {name: "American Hot", price:  18.99},
      {name: "Chicken Feast", price:  17.99},
      {name: "Hawaiian", price:  18.99},
      {name: "Meateor", price:  18.99},
    ]
    account_sid = 'AC2dcc305129bcd9a5749f74ac4a0e99c9'
    auth_token = 'b0d1d4b38109dedb04f2cd829fd3e043'
    @current_order = Order.new
    @client = Twilio::REST::Client.new account_sid, auth_token
  end


  def view_menu
    count = 0
    puts "Today's menu"
    @dishes.each do |pizza|
      count += 1
      puts("#{count}. #{pizza[:name]} - #{pizza[:price]}")
    end
    puts
  end

  def order_dish(dish, quantity)
    @current_order.select_item(dishes[dish-1],quantity)
  end

  def confirm_order(total)
    wrong_total?(total) ? text_order("#{print_current_order} arriving by #{Time.new.hour+1}:#{Time.new.min}") : not_verified_message
  end

  def print_current_order
    @current_order.print_items
  end

  private
  def not_verified_message
    "Entered amount does not match total."
  end

  def calculate_total
    current_order.total
  end

  def wrong_total?(total)
    total == calculate_total
  end

  def text_order(body)
    client.messages.create(from: '441582380423', to: '447713476196', body: body)
  end
end
