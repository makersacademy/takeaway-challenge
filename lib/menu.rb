require_relative 'dish'



class Menu

attr_reader :dishes

  def initialize(dish_class: Dish)
    @dishes = []
    @dish_class = dish_class
  end

  def add_dish(name, price)
    @dishes << @dish_class.new(name, price)
  end

  def show_menu
    string = ""
    @dishes.each{|dish| string << dish.name << " : $" << dish.price.to_s << " \n"}
    puts string
  end

end
