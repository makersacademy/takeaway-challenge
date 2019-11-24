require_relative 'menu'

class MyOrder

  attr_reader :my_order

  def initialize(menu = Menu.new)
    @my_order = [
    ]
    @menu = menu
  end

  def show_order
    @my_order.each do |dish|
      puts dish
    end
  end

  def select_dish(dish_number)
    @menu.dishes.each do |dish|
      if dish[:number] == dish_number
        @my_order << dish
      end
    end
  end
end
