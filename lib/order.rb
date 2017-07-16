require 'dish_list'

class Order
  attr_reader :total, :order_data

  def initialize(data)
    raise "Not enough data to create an order." unless data[:order]
    @list = data[:list] || DishList.new
    @order_data = data[:order]
    @total = 0
    update_total
  end

  private

  def list_data
    @list.data
  end

  def update_total
    order_data.each { |k, v| @total += list_data[k] * v }
  end
end
