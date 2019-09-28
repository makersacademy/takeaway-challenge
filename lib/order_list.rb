require_relative 'menu'

class OrderList

  attr_reader :order_list

  def initialize
    @order_list = Hash.new(0)
    @order_summary = []
    @menu = Menu.new
  end

  def add_to_hash(item, quantity)
    @order_list[item] += quantity
  end

  # def order_summary
  #   @order_list.each do |key, value|
  #     "#{value} x #{key} = #{value * @menu.price(key)}"
  #   end
  # end

  def total
    total = 0
    @order_list.each do |key, value|
      total += value * @menu.price(key)
    end
    total
  end
end
#
# order = OrderList.new
# order.add_to_hash('calzone', 2)
# order.add_to_hash('calzone', 1)
# p order.order_summary
# p order.total
