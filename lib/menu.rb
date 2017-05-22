require_relative 'dish'

class Menu

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def show_menu
    @dishes.map.with_index do |dish, number|
      "#{number + 1}. #{dish.name}, £#{'%.2f' % dish.price}"
    end.join(", ")
  end

  def select_dish(dish_name)
    @dishes.find { |dish| dish.name == dish_name }
  end

  def contain_dish?(dish_name)
    @dishes.any? { |dish| dish.name == dish_name }
  end
end
