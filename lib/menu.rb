require 'dish'

class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_to_menu(name, price)
    @dishes << Dish.new(name, price)
  end

  def compile_menu
    list = @dishes.map do |dish|
      "#{dish.name}: #{dish.price}\n"
    end
    list.join
  end
end
