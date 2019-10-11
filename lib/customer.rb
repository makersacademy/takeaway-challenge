require_relative 'restaurant'

class Customer
  attr_accessor :order

  def initialize
    @order = []
  end

  def see_menu(restaurant)
    output = ""
    restaurant.menu.each do |dish, price|
      output += "#{dish} are £#{price}\n"
    end
    puts output
    output
  end

  def get_order(restaurant)
    see_menu(restaurant)
    current_order = []
    puts "Enter item:"
    item = gets.chomp
    puts "Enter amount:"
    num = gets.chomp.to_i
    current_order << item
    current_order << num
    check_order(current_order, restaurant)
    puts "Total cost of order is £#{total_price(restaurant)}"
  end

  def check_order(current_order, restaurant)
    if restaurant.menu.include?(current_order[0]) && current_order[1].positive? && current_order[1].integer?
      cost = total_price(restaurant)
      current_order << cost
      @order << current_order
    else
      raise 'Order Invalid'
    end
  end

  def total_price(restaurant)
    cost = 0
    @order.each do |order|
      restaurant.menu.each do |item, price|
        if order[0] == item
          cost += price*order[1]
        end
      end
    end
    cost
  end

  # def order_status
  #   if @order == []
  #     raise 'No Order'
  #   else
  #     true
  #   end
  # end
end

# customer = Customer.new
# restaurant = Restaurant.new
# customer.get_order(restaurant)
