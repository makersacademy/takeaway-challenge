require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :customer_order, :payment

  def initialize
    @order = Order.new
    @customer_order = []
  end

  def list_dishes
    MENU_ITEMS.each_with_index do |(name, price), index|
      puts "#{index + 1}. #{name} - £#{price}"
    end
  end

  def make_order(item, quantity)
    fail "Sorry, that's not on the menu" unless MENU_ITEMS.has_key?(item)
    @order.place_order(item, quantity)
    create_order
    find_cost
    next_order
  end

  def checkout(payment)
    fail 'No orders' if @customer_order.empty?
    fail 'Please enter the correct amount' if payment != @order.in_basket.sum
  end

  def summary
    puts @customer_order
    puts "Current total is £#{'%.2f' % (@order.in_basket.sum)}"
  end

  private

  def create_order
    food = {
      :item => @order.item,
      :quantity => @order.quantity
    }
    @customer_order.push(food)
  end

  def find_cost
    @order.find_cost
  end

  def next_order
    @order.item = nil
    @order.quantity = nil
  end
end
  