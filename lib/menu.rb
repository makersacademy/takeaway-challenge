class Menu
  def initialize dishes
    @dishes = [] + dishes
  end

  def list_dishes
    output = "Number | Dish".ljust(32) + "Price\n"
    @dishes.each_with_index do |dish, i|
      output << "[#{i+1}]".ljust(9)
      output << dish.name.ljust(20, '.')
      output << ("%.2f\n" % [dish.price]).rjust(9,'.')
    end
    output
  end

  def select_dish number
    @dishes[number - 1]
  end
end
