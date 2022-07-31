require_relative 'send_sms'

class Restaurant
  attr_reader :order
  @message = Message.new
  def initialize
    @menu = {
      "Fries" => 2,
      "Milkshake" => 4
    }

    @order = []
  end
  
  def display_menu
    @menu.each do |meal, price|
      puts "#{meal} - £#{price}"
    end
  end

  def add_meal(meal, quantity = 1)
    @order.push([meal, quantity])
  end

  def display_order
    @order.each do |meal, quantity|
      price = @menu[meal]
      puts "#{quantity}x #{meal} - £#{price}"
    end
    total()
  end

  def total
    total = 0
    order.each do |meal, quantity|
      price = @menu[meal]
      total += price * quantity
    end
    puts "Order total: £#{total}"
  end
  
  def place_order
    if @order.empty?
      raise("Order empty, unable to place an empty order.")
    end
    @message
    puts "Order, placed. You will receive a confirmation SMS."
  end
end
