require 'yaml'

class Menu
  def initialize
    @dish_list = load_dish_list
  end

  def list
    @dish_list.dup
  end

  def price(item)
    fail 'Item not in menu!' unless list.include?(item)
    list[item]
  end

  private

  def load_dish_list
    YAML.load_file('./docs/dish_list.txt')
  end
end
