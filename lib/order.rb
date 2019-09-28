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

  def total_basket
    "Your total cost for this order is £#{calculate_cost}"
  end

  def check_out(expected_cost)
    fail "Difference between expected cost and calculated cost" if expected_cost != calculate_cost
    "Press 'Place Order' to submit your order through to the restaurant"
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

end
