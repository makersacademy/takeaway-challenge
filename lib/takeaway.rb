require_relative 'order'
require_relative 'menu'

class Takeaway

  attr_accessor :thisorder, :order

  def initialize(order = Order.new)
    @order = order
  end

  def see_menu
    puts "Our menu is #{Order::MENU}, we have no vegan options stop asking"
  end

  def show_menu
    Order::MENU.each do |price, item|
      puts "#{item}, £#{price}"
    end
      puts "We have no vegan options stop asking."
  end

  def add_order
    @order.add_to_order
  end

  def return_total
    puts "Your total amounts to #{@order.total}"
  end

  def order_complete
    puts "Thank you for your order your total is #{@order.total}."
    puts "You will recieve a text message confirming your amount."
  end
# Still not sure how to make this valid
# Why would a user need to check the amount they are paying versus what is in thier cart
# Should ust be able to view the order
  # def correct_amount?
  #   @order.total == @order.sum
  # end

end
