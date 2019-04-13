require_relative 'order'

class Menu

  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def view_menu
    @dishes.map  { |dish, price|
      "#{dish.capitalize}: £#{price}"
    }.join(', ')
  end

  def prices(dish)
    dishes[dish]
  end

end
