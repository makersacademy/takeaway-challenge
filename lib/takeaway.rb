require_relative 'order'
require_relative 'menu'

class Takeaway
  include Menu
  attr_reader :orders, :total_cost

  def initialize(order_class = Order)
    @total_cost = 0
    @orders = []
    @order_class = order_class
  end

  def show_menu
    MENU.each do |k,v|
      puts "#{k}. #{v[:dish]} - £#{v[:cost]}"
    end
  end

  def order_item(num, quantity = 1)
    @orders << @order_class.new(num, quantity)
    add_cost
    puts "Ordered dish: #{MENU[num][:dish]} x #{quantity}"
  end

  def check_order
    fail "No orders placed" if @orders.count < 1
    
    order_no = 1
    @orders.each do |order|
      puts order_no
      puts "Dish: #{order.dish}"
      puts "Quantity: #{order.quantity}"
      puts "Cost: £#{order.cost}"
      puts ""
      order_no += 1
    end

    puts "Total dishes: #{@orders.count}"
    puts "Total cost: £#{@total_cost}"
  end

  def complete_order
    fail "No orders placed" if @orders.count < 1
    puts confirmation_message = "Thank you! Your order was placed and will be delivered before #{Time.now + 60 * 60}"
  end

  
  private
  def add_cost
    @total_cost += @orders[-1].cost
  end
end
