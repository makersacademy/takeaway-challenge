require "./lib/dish.rb"

class Menu 
  attr_reader :dishes

  def initialize(dishes = nil)
    @dishes = []
    @dishes << Dish.new("spring roll", 0.99)
    @dishes << Dish.new("char sui bun", 3.99)
    @dishes << Dish.new("pork dumpling", 2.99)
    @dishes << Dish.new("peking duck", 7.99)
    @dishes << Dish.new("fu-king fried rice", 5.99)

    @dishes = dishes unless dishes.nil?
  end

end
