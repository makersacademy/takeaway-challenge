require 'twilio-ruby'
require_relative './twilio_passwords.rb'

class Order

  include Passwords

  attr_reader :menu, :current_order

  def initialize

    @current_order = [0, 0, 0, 0, 0]
    @menu = [{ item: "Chips", price: 0.99 },
              { item: "Ham Sandwhich", price: 1.49 },
              { item: "Curry and Rice", price: 3.99 },
              { item: "Fried Chicken", price: 2.79 },
              { item: "Pizza", price: 2.99 }] 
  end

  def view_menu(menu = @menu)

    # argument only for test, always defaults to @menu

    puts "Which item would you like to order?"
    menu.each_with_index { |item, index|
      puts "#{index + 1}: #{item[:item]}: £#{item[:price]}"
    }
  end

  def add(item, amount)

    item.between?(1, 5) ? (current_order[item - 1] += amount) : (puts "Try again")
  end

  def total

    total_amount = 0
    current_order.each_with_index { |amount, item|
      total_amount += (@menu[item][:price] * amount)
    }
    return total_amount
  end

  def checkout

    return false if current_order == [0, 0, 0, 0, 0]

    client = Twilio::REST::Client.new(Passwords::ACCOUNT_SID, Passwords::AUTH_TOKEN)
    client.messages.create(
    from: Passwords::FROM,
    to: Passwords::TO,
    body: "Thank you! Your order was placed and will be delivered before #{add_hour}"
    )
    # send @current_order to restaurant
    return true
  end

  private

  def add_hour

    time = Time.new
    hour = time.hour
    hour == 23 ? hour = 0 : hour += 1
    return "#{hour}:#{time.min}"
  end
end

puts "Type order = Order.new to make new order"
puts "Type order.view_menu to see menu"
puts "Type order.add(x,y) to add items, x is item you wish to add, y is number you wish to order"
puts "Type order.total to see current total"
puts "Type order.checkout to checkout"
