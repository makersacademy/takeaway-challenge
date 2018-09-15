class Menu

  attr_reader :dishes, :dish

  def initialize
    @dishes = []
    @dish = dish
  end

  def add_dish(dish)
    @dishes << { name: dish.name, price: dish.price }
  end

  def show_menu
    @dishes.collect! do |dish|
       "#{dish[:name].capitalize}: £#{dish[:price]}"
    end
    @dishes.join("\n")
  end
end
