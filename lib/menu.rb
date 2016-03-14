class Menu
  ALREADY_EXISTS_ERROR = 'Dish is already on the menu'.freeze
  DOES_NOT_EXIST_ERROR = 'This dish is not on the menu'.freeze
  def initialize(dish_klass: dish_class)
    @dishes = []
    @dish_klass = dish_klass
  end

  def add(dish_name, dish_price)
    create_dish(dish_name, dish_price)
    raise ALREADY_EXISTS_ERROR if in_menu?
    save_dish
  end

  def remove(dish_name)
    find_dish(dish_name)
    fail DOES_NOT_EXIST_ERROR unless in_menu?
    delete(dish_name)
  end

  def dishes
    @dishes.dup.freeze
  end

  def change_price(dish_name, new_price)
    find_dish(dish_name)
    @dish.update_price(new_price)
    update_menu
  end

  def change_name(dish_name, new_name)
    find_dish(dish_name)
    @dish.rename(new_name)
    update_menu
  end

  def find_dish(dish_name)
    @dishes.each do |dish|
      if dish.name == dish_name
        @dish = dish
        return @dish
      end
    end
    fail DOES_NOT_EXIST_ERROR
  end

  private

  def delete(dish_name)
    find_dish(dish_name)
    @dishes.delete @dish
  end

  def update_menu
    delete(@dish.name)
    save_dish
  end

  def save_dish
    @dishes << @dish
  end

  def in_menu?
    @dishes.include? @dish
  end

  def create_dish(name, price)
    @dish = @dish_klass.new(name: name, price: price)
  end
end
