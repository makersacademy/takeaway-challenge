require_relative 'dishes'
require_relative 'total'
require_relative 'calculator'

class Order < Calculator
  include Dishes

  attr_accessor :verify_order, :user_total, :order

  def choose_dishes(*order, user_total)
    @user_total, @order = user_total, order
    shift_to_calculator()
    total()
  end

  def verify_order
    @dish_number <= dish_list.size && @dish_number > 0
  end

  def total
    Total.new(order, user_total)
  end

end
