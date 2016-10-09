class DishList

  def initialize(dish_class)
    @dish_class = dish_class
    @dishes = []
  end

  def add_dish(dish_data)
    dish = @dish_class.new(name: dish_data[0], price: dish_data[1])
    @dishes << dish
  end

  def dishes
    @dishes.dup
  end

  def to_s
    str = ''
    dishes.each_with_index do |dish, id|
      id_s    = "#{id+1}.".ljust(4)
      name_s  = "#{dish.name}".ljust(30)
      price_s = "#{'%.2f' % dish.price}".rjust(5)

      str << id_s + name_s + price_s + "\n"
    end
    str
  end
end
