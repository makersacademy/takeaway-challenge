
class Menu
attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def display_menu
    @dishes
  end

  def dish_available?(dish)
    !!@dishes[dish]
  end
  def calculate_price(dish)
    @dishes[dish]
  end
end # => menu class
