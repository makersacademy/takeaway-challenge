require_relative 'dish'



class Menu

M_W = 13


attr_reader :dishes

  def initialize(dish_class: Dish)
    @dishes = []
    @dish_class = dish_class
  end

  def add_dish(name, price)
    @dishes << @dish_class.new(name, price)
  end

  def show_menu
    string = "DISH".ljust(M_W) + "|".center(M_W) +  "PRICE     ".rjust(M_W) +  "\n"
    @dishes.each do |dish|
      string << dish.name.ljust(M_W) + "|".center(M_W) + "$\ #{dish.price.to_s}     ".rjust(M_W) + "\n"
    end
    string
  end

  def choose(dish)
    @dishes.each_with_index do |plate, index|
      return plate if plate.name == dish
    end
  end

end
