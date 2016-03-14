require 'pry'
class Menu

attr_reader :order, :dishes

  def initialize(dish_class=Dish)
    @dish_class = dish_class
    @dishes = Hash.new

  end

  def create_dish(name, price)
    @dishes[name] = @dish_class.new(name, price)
  end

  def see_dishes
    raise 'there are no dishes' if @dishes.empty?
    @dishes.each_value do |dish| 
      dish.name
      dish.price
    end
  end

  def delete_dish(name)
    @dishes.delete(name)
  end

  def dish_price(name)
    @dishes[name].price
  end

end