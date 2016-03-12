class Menu

  def initialize(dish_class=Dish)
    @dish_class = dish_class
    @dishes = Hash.new

  end

  def create_dish(name, price)
    @dishes = {name => @dish_class.new(name, price)}
  end

  def see_dishes
    raise 'there are no dishes' if @dishes.empty?
    @dishes.each_value do |dish| 
      puts dish.name
      print dish.price
      end
  end

end