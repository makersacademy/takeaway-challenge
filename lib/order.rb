
class Order

  attr_reader :order, :order_number

  def initialize(takeaway)
    @order = []
    @takeaway = takeaway
    @order_number = order_number
  end

  def add_item(number, takeaway)
    @order << takeaway.menu_item(number)
  end

  def customer_input(takeaway)
    takeaway.menu.each{ |a| puts"#{a}/n" }

    puts "Type in the menu number for your order. Type 0 to complete your order"

    loop do
      n = gets.chomp.to_i
      add_item(n, takeaway)
      @order.each{ |a| puts"#{a}" }
      puts "Type in the menu number for your order. Type 0 to complete your order"
      break if gets.chomp == "0"
    end
  end



end
