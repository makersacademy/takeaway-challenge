require_relative 'list'

class Takeaway

  attr_reader :user_order, :check_arr
  attr_accessor :total_price

  def initialize(list)
    @menu = list.dish_list
    @user_order = Hash.new
    @total_price = nil
  end

  def show_list
    @menu
  end

  def order_meal(dish, quantity)
      if @menu.has_key?(dish)
        user_order[dish] = [quantity, @menu[dish]]
      else
        raise "Item not in list"
      end
  end

  def show_price
    # check user order against list price and multiply by user order quantity
    @check_arr = []
    @user_order.each_pair do |key, value|
      multiple = value[0] * value[1]
      check_arr.push multiple
    end
    @total_price = @check_arr.inject(0){|x,y| x + y}
  end

  def show_order_list

  end
end
