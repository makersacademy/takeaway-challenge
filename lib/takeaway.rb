require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :customer_order, :order, :itemnum

  def initialize
    @order = Order.new
    @customer_order = []
  end

  def list_dishes
    MENU_ITEMS.each_with_index do |(name, price), index|
      puts "#{index + 1}. #{name} - #{price}"
    end
  end

  def make_order(itemnum, quantity)
    @order.place_order(itemnum, quantity)
    create_order
    # next_order
  end

  private

  def create_order
    food = {
      :itemnum => @order.itemnum,
      :quantity => @order.quantity
    }
    @customer_order.push(food)
    puts @customer_order
  end

# needs more work
#   def next_order
#     itemnum = nil
#     quantity = nil
#   end
end
  