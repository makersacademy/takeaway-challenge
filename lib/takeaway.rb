require_relative 'order.rb'

class Takeaway

  def initialize(order_Klass, sms_Klass)
    @order = order_Klass.new(sms_Klass)
  end

  def add_to_basket(item, number = 1)
    order.add_to_basket(item, number)
  end

  def print_menu
    puts "\t Item \t\t Price"
    menu.each{ |food, price|
      puts "\t #{food} \t\t #{price}"
    }
  end

  def print_basket
    if basket.empty?
      puts "Your basket is empty."
    else
      puts "Your basket contains:"
      basket.each do |food, quantity|
        print "#{quantity}x #{food}#{quantity>1 ? "s" : ""}"
        puts " costing £#{quantity * order.menu[food]}"
      end
      puts "\n\tTotal : £#{total}"
    end
  end

  def checkout(total)
    order.checkout(total)
  end

  private

  attr_reader :order

  def menu
    order.menu
  end

  def basket
    order.basket
  end

  def total
    order.total
  end

end
