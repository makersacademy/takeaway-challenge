require_relative "order"

class Check

  def check(order)
    @order = order
    list_items_header
    list_order_items(@order)
    order_sumtotal(@order)
    list_items_footer
    order_check_input
  end

  private

  def initialize
    @menu = Menu.new.menu
    @sumtotal = 0
  end

  def list_items_header
    puts "Please review the order below for accuracy"
    puts ""
    puts "You ordered:"
  end

  def list_order_items(order)
    order.each{|item| puts "#{item} - £#{@menu[item]}"}
  end

  def order_sumtotal(order)
    order.each{|item| @sumtotal += @menu[item]}
    puts "Your total is £#{@sumtotal}"
  end

  def list_items_footer
    puts "Are these items and the subtotal correct?"
    puts "Enter 1 for yes and 2 for no."
    print "> "
    order_check_input
  end

  def order_check_input
    @order_check_input = gets.chomp.to_i
    if @order_check_input == 1
      # send sms
    elsif @order_check_input == 2
      puts "Please type in the items that you would like to remove" # make remove method
    else
      puts "Invalid input."
      list_items_footer
    end
  end
end
