require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :customer_order 

  def initialize
    @order = Order.new
    @customer_order = []
  end

  def list_dishes
    MENU_ITEMS.each_with_index do |(name, price), index|
      puts "#{index + 1}. #{name} - #{price}"
    end
  end

  def make_order(item, quantity)
    fail "Sorry, that's not on the menu" unless MENU_ITEMS.has_key?(item)
    @order.place_order(item, quantity)
    create_order
    find_cost
    next_order
  end

  def checkout
    fail 'No orders' if @customer_order.empty?
    puts "Total cost of your order today is #{@order.in_basket.sum}"
  end

  private

  def create_order
    food = {
      :item => @order.item,
      :quantity => @order.quantity
    }
    @customer_order.push(food)
    puts @customer_order
  end

  def find_cost
    @order.find_cost
  end

  def next_order
    @order.item = nil
    @order.quantity = nil
  end
end
  