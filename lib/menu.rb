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

    @dishes << [dishes.length + 1, name, price]
    "Dish added: #{name} - £#{price}"
  end

  def print_dishes
    @dishes.map.with_index { |dish, index|
      "#{index + 1}. #{dish[1]} - £#{dish[2]} \n"
    }.join()
  end

  private

  def dish_name_check(name)
    raise if dishes.any? { |dish| dish[1] == name }
  end
end
