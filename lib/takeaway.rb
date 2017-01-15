require_relative 'list'

class Takeaway

  attr_reader :user_order

  def initialize(list)
    @menu = list.dish_list
    @user_order = Hash.new
  end

  def show_list
    @menu
  end

  def order_meal(dish, quantity)
      if @menu.has_key?(dish)
        user_order[dish] = quantity
      else
        raise "Item not in list"
      end
  end
end
