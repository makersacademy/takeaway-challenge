class DishList
  private
  attr_writer :dish_list, :selected_dishes
  public
  attr_reader :dish_list, :selected_dishes

  def initialize(dish_list = [])
    @dish_list = dish_list
    @selected_dishes = Hash.new(0)
  end

  def add_dish(dish)
    dish_list << dish
  end

  def display_menu
    menu = ""
    dish_list.each_with_index { |dish, index| menu << "#{index+1}. #{dish.name}: £#{'%.2f' % dish.price}\n"}
    menu.chomp
  end

  def select_item(index, quantity = 1)
    selected_dishes[dish_list[index - 1]] +=  quantity if dish_list[index - 1] if quantity > 0
  end

end