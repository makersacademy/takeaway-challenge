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
  def total_cost
    cost = 0
    @basket.each { |food, quantity| cost += @menu.menu[food] * quantity }
    cost
  end

  def correct_total?(total_price)
    calculate_bill == total_price
  end

  def finish_order(amount)
   raise "Wrong total!" unless correct_total?(amount)
   @message.send_message("Thank you! Your order was placed and will be delivered at #{time_delivered}.The total cost is #{total_cost}.")
 end
end
