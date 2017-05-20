require_relative 'dish'

class Menu
  # attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def read_menu
    @dishes.each_with_index do |dish, number|
      return "#{number + 1}. #{dish.name}, £#{'%.2f' % dish.price}"
    end
  end
end
