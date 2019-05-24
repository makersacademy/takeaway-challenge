class Order

  def initialize( dish_list=DishList.new )
    @dish_list = dish_list
  end

  def view_dishes
    @dish_list.menu
  end



end
