class DishList
  private
  attr_writer :dish_list, :selected_dishes
  public
  attr_reader :dish_list, :selected_dishes

  def initialize(dish_list = [])
    @dish_list = dish_list
    # @selected_dishes = Hash.new(0)
  end

  def add_dish(dish)
    dish_list << dish
  end

  def to_s
    menu = ""
    dish_list.each_with_index { |dish, index| menu << "#{index+1}. #{dish}\n"}
    menu.chomp
  end
end
