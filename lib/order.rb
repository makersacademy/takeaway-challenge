require_relative 'menu'

class Order

  attr_reader :total_order

  def initialize
    @menu = Menu.new
    @total_order = []
  end

  def read_menu
    @menu.show_menu
  end

  def add_item(item, quantity = 1)
    order_item = {}
    order_item[item] = quantity
    @total_order << order_item
    puts "#{item} x#{quantity} added to your basket"
  end

  def order_summary
    order_summary = []
    @total_order.each do |order_hash|
      order_hash.each do |item, quantity|
        order_summary << "#{item} x#{quantity} = £#{@menu.menu[item] * quantity}"
      end
    end
    puts order_summary.join(', ')
    puts total_basket
  end

  def check_out(expected_cost)
    error_message = "Difference between expected cost and calculated cost"
    fail error_message if expected_cost != calculate_cost
    puts "Type Confirm to place your your order"
    @confirmation = gets.chomp
    confirm_order
  end

  private

  def calculate_cost
    cost = 0
    @total_order.each do |order_hash|
      order_hash.each do |item, quantity|
        cost += @menu.menu[item] * quantity
      end
    end
    cost
  end

  def total_basket
    "Your total cost for this order is £#{calculate_cost}"
  end

  def calculate_time
    time = Time.now
    "#{(time + 3600).strftime("%H:%M")}"
  end

  def confirm_order(time = calculate_time)
    message = "Thank you! Your order was placed and will be delivered before #{time}"
    return message if @confirmation == "Confirm"
  end

end
