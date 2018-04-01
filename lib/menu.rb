require_relative 'dish'

class Menu

attr_reader :dishes
attr_accessor :selection

  def initialize #(dish1 = Dish.new("sushi"), dish2 = Dish.new("pizza"), dish3 = Dish.new("laksa"))
    @dishes = []
    @selection = []
  end

  def make_dish(type, price)
    @type = type
    @price = price
    @dish = {type => price}
  end

  def add_dish
    @dishes << @dish
  end

  def remove(dish)
    @dishes.delete(dish)
  end

  def select_sushi
    @selection << {"sushi" => 1}
  end

  def select_laksa
    @selection << {"laksa" => 1}
  end

  def select_pizza
    @selection << {"pizza" => 1}
  end

  def choice1
    menu.make_dish("sushi", 1)
    menu.add_dish
  end


end
