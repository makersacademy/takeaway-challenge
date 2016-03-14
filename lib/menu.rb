require_relative 'dishes'
class Menu

  def initialize(dish_class: Dishes)
    @dish_class = dish_class
    @dishes = []
  end

  def add_dish(name,price)
    @dishes <<  @dish_class.new(name,price)
  end

  def all_dishes
    @dishes.dup
  end

  def list_dishes
    list = ""
    @dishes.each{|dish| list << "#{dish.name} - #{dish.price}|"}
    list
  end
private
attr_reader :dishes
end

# one class which is interface 
