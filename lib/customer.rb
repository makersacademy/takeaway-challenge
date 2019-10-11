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
    if restaurant.menu.include?(item)
      current_order << item
      puts "How many #{item} do you want?"
      num = gets.chomp.to_i
      if num.positive? && num.integer?
        current_order << num
        @order << current_order
        puts "You requested to make an order of #{num} #{item}"
        return @order
      else
        puts "Incorrect amount"
      end
    else
      puts "Item doesn't exist on the menu"
    end
    raise 'Order was invalid'
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
