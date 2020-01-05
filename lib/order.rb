require_relative 'menu'
require_relative 'dish'
class Order
  attr_reader :order

  def initialize(order_line_class)
    @menu = Menu.new(Dish)
    @menu = @menu.load
    @order_line = order_line_class
    @order = []
  end

  def create(selection, quantity)
    raise "Item not in menu" if @menu[selection - 1].nil?

    dish = @menu[selection - 1]
    @order << @order_line.new(quantity, dish["name"], dish["price"])
  end

  def total
    total = 0
    @order.each { |item| total += (item.quantity * item.price) }
    return total
  end
  
  def show
    puts "No.  Price     Name"
    @order.each { |item| 
      puts "#{item.quantity}    £#{item.price}  #{item.name}."
    }    
    puts "Total : £ #{total}"
  end
end
