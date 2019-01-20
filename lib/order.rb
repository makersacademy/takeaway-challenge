require_relative 'menu'

class Order
attr_reader :menu, :order_list

  def initialize
    @menu = Menu.new
    @order_list = []
  end

  def take_order(item, quantity = 1)
    @order_list << {:item => item, :quantity => quantity}
  end

  def calculate_bill
    sum = 0
    @order_list.each do |thing|
      sum += @menu.dishes[thing[:item]] * thing[:quantity]
    end
    sum
  end

  def correct_total?(total_price)
    calculate_bill == total_price
  end
end
