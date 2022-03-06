require_relative 'send_sms'
require_relative 'dish'

class Order

  def initialize
    @order = []
  end

  attr_reader :order

  def add_to_order(dish)
    @order << dish
  end

  def show_my_order
    get_items_and_costs
  end

  def confirm_order
    confirmation_text
  end
end

private
def get_items_and_costs
  total_cost = 0
    @order.each do |item|
      puts "#{item.name}: £#{item.price}"
      total_cost += item.price
    end
    puts "Total Price: £#{total_cost}"
end