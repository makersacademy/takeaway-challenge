require './lib/dish_list.rb'

class Order

  attr_reader :price_tracker, :dish_list

  def initialize( dish_list=DishList.new )
    @dish_list = dish_list
    @price_tracker = []
  end

  def view_dishes
    @dish_list.menu
  end

  # def food_selection(item, quantity=1)
  #   @dishlist.dish_list_prices[item]
  # end

end
