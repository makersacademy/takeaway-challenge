require './docs/twilio_msg.rb'
#
# require 'dotenv'
# Dotenv.load

class Takeaway

attr_reader :table_order

  def initialize
    @table_order = Array.new
    @text_order = Text.new
  end

  def show_menu
    puts full_menu
  end

  def order(item, quantity)
      @table_order << [item, quantity]
  end

  def bill
    calculate_bill
  end

  def place_order
    message = "Thank you! Your order was placed and will be delivered before"
    time = (Time.new + 3600).strftime("%H:%M")
    bill = calculate_bill
    @text_order.confirm_order(message + " #{time} totalling #{bill}")
  end


  def menu
    @menu_list = {"ceaser salad" => 3.50,
            "spring rolls" => 2.50,
            "maki rolls" => 3.00,
            "arancini" => 3.00,
            "steak" => 7,
            "panang curry" => 6.50,
            "california roll" => 6,
            "penne alfredo" =>6 ,
            "pizza" => 5.50,
            "baby back ribs" => 7.50,
            "sticky toffee pudding" => 3.50,
            "ice cream" => 3,
            "cheesecake" => 4,
            "chocolate mousse" => 2.50}
  end

private

  def full_menu
    self.menu.each do |key, value|
      puts "#{key}".ljust(35) + "£#{'%.2f' % value}".ljust(35)
    end
  end

  def calculate_bill
    price = @table_order.map do |item, quantity|
      self.menu[item] * quantity
    end
    "£#{'%.2f' % price.inject(:+)}"
  end

end
