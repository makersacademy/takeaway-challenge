require './lib/message'

class Order

attr_reader :dishes, :current_order

  def initialize(dishes)
    @dishes = dishes
    @current_order = {}
    @message = Message.new
  end

  def select_dish(dish, num)
    raise "There is no #{dish} in the list. Please select a dish from the list." if !dishes.include?(dish)
    @current_order[dish] = num
    "You added #{num} #{dish} to your order."
  end

  def total
    (dishes.keys & current_order.keys).map {|d| dishes[d] * current_order[d]}.inject(:+)
  end

  def confirm_total(user_total)
    raise "Your total is not correct. Enter #{total} to process the order." unless user_total == total
    @message.send
    true
  end

end
