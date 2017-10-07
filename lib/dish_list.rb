class DishList
  private
  attr_writer :dish_list
  public
  attr_reader :dish_list

  def initialize(dish_list = [])
    @dish_list = dish_list
  end

  def add_dish(dish)
    dish_list << dish
  end

  def display_menu
    menu = ""
    dish_list.each_with_index { |dish, index| menu << "#{index+1}. #{dish.name}: £#{'%.2f' % dish.price}\n"}
    menu.chomp
  end

end