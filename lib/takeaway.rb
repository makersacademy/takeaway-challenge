require_relative 'order'

class Takeaway

  attr_reader :order

  WRONG_TOTAL_ERROR = 'Order total incorrect, please try again'
  ORDER_SUCCESS_MSG = 'Order placed succesfully'

  def initialize(dishes, order_klass) #= Order
    @dishes = dishes
    @order = order_klass.new
  end

  def list_dishes
    list = ""
    @dishes.each_with_index do |dish, index|
      num, name, price = (index + 1).to_s, dish.name, dish.price.to_s
      list << three_col_line(num, name, price)
    end
    list
  end

  def add_to_order(dish_num, quantity)
    @order.add( get_dish(dish_num), quantity)
  end

  def place_order(total)
    raise WRONG_TOTAL_ERROR unless total == @order.total
    order_success
  end

  private

  def get_dish(dish_num)
    @dishes[dish_num - 1]
  end

  def order_success
    ORDER_SUCCESS_MSG
  end

  def three_col_line(str1, str2, str3)
    str1.ljust(10) + str2.ljust(10) + str3.rjust(6) + "\n"
  end

end
