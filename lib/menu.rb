# require_relative 'dish'

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

    @dishes << [name, price]
    "Dish added: #{name} - £#{price}"
  end

  def print_dishes
    @dishes.map.with_index { |dish, index|
      "#{index}. #{dish[0]} - £#{dish[1]}"
    }.join()
  end

  private

  def dish_name_check(name)
    raise if dishes.any? { |dish| dish[0] == name }
  end
end
