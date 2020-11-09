require_relative 'menu'
require_relative 'order'
require_relative 'texter'

class Takeaway
  attr_reader :menu, :order

  def initialize(order = [], menu = Menu.new, texter = Texter.new)
    @order = order
    @menu = menu
    @texter = texter
  end

  def view_menu
    @menu.view
  end

  def add(item, quantity = 1)
    raise "Please enter a item on the menu" if check_item(item) == false

    @order << { Item: item, Quantity: quantity, Price: @menu.falafel_menu.fetch(item) }
  end

  def check_item(item)
    @menu.falafel_menu.key?(item)
  end

  def total
    "£%.2f" % (@order.map { |h| h[:Price] * h[:Quantity] }).inject(:+)
  end
  
  def checkout
    print_order
    total
    p "To order, please call the complete_order method passing your number through as an argument"
  end

  def print_order
    header
    @order.each do |element|
      puts "-------------------------"
      element.each do |key, value|
        pp "#{key}: #{value}"
      end
    end
    puts "-------------------------"
  end

  def header
    puts "-------------------------"
    puts "Order Summary".center(25)
    puts "-------------------------"
  end

  def complete_order(number)
    send_text(total, number)
  end

  def send_text(total, number)
    @texter.send_text(total, number)
  end

end
