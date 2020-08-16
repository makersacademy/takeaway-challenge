require_relative 'menu'
require_relative 'text'

require 'twilio-ruby'

class Order

  include Menu, Text
  attr_accessor :customer_order

  def initialize
    @customer_order = {}
    text
  end

  def text
    puts "This is our takeaway menu for today:"
    show_menu
    customer_selection
    show_order
    order_price
  end

  def show_menu
    DISHES.map { |name, price| puts "#{name} - £#{price}" }
  end

  def add_dish
    @customer_order[@dish] = @quantity
  end

  def customer_selection
    while true do
      puts "Pick a dish you'd like the add or type 'done' twice to finish your order."
      @dish = gets.chomp
      puts "Select quantity of dish or type 'done' again to finish your order."
      @quantity = gets.chomp
      if @dish == "done"
        break
      elsif DISHES.keys.include? @dish
        add_dish
      elsif !DISHES.keys.include? @dish
        puts "This item isn't on the menu, please select something else."
      end
    end
  end

  def show_order
    puts "Order summary:"
    @customer_order.each do |name, quantity|
      price_of_item = DISHES[name]
      puts "x#{quantity} #{name}- £#{price_of_item}"
    end
  end

  def order_price
    prices = []
    @customer_order.each do |name, quantity|
      price_of_item = DISHES[name]
      price = price_of_item * quantity.to_f
      prices.push(price)
    end
     total = prices.sum
     @total_rounded = total.round(2)
     puts "The total price of your order is £#{@total_rounded}"
     payment_confirmation
  end

  def payment_confirmation
    puts "To confirm payment, please enter payment amount:"
    price_confirm = gets.chomp.to_f
    if price_confirm != @total_rounded
      puts "Wrong amount, please try again."
      order_price
    else
      return send_message
    end
  end

end
