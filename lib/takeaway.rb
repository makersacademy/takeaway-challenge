class Takeaway

  attr_reader :order

  WRONG_TOTAL_ERROR = 'Order total incorrect, please try again'

  def initialize(dishes)
    @dishes = dishes
    @order = []
  end

  def list_dishes
    list = ""
    #list << three_col_line('Num','Name','Price')
    #list << three_col_line('---','----','-----')
    @dishes.each_with_index do |dish, index|
      num, name, price = (index + 1).to_s, dish.name, dish.price.to_s
      list << three_col_line(num, name, price)
    end
    list
  end

  def add_to_order(dish_num, quantity)
    @order << [@dishes[dish_num], quantity]
  end

  def place_order(total)
    raise WRONG_TOTAL_ERROR unless total == order_total
  end

  private

  def order_total
  end

  def three_col_line(str1, str2, str3)
    str1.ljust(10) + str2.ljust(10) + str3.rjust(6) + "\n"
  end

end
