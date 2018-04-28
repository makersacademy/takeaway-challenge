require_relative 'dish'

class Menu
  def initialize(class_type = Dish)
    @dishes = []
    @class_type = class_type
  end

  def dishes
    @dishes.dup
  end

  def add_dish(name, price)
    dish_name_check(name)

    @dishes << @class_type.new(dishes.length + 1, name, price)
    "Dish added: #{name} - £#{price}"
  end

  def print_dishes
    @dishes.map { |dish|
      "#{dish.id}. #{dish.name} - £#{dish.price} \n"
    }.join()
  end

  private

  def dish_name_check(name)
    raise if dishes.any? { |dish| dish.name == name }
  end
end
