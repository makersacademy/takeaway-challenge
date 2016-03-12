require 'yaml'

class Menu
  def initialize
    @dishes = {}
  end

  def add(dish, price)
    @dishes[dish.to_sym] = price
  end

  def remove(dish)
    @dishes.delete(dish.to_sym)
  end

  def load_menu(path = './menu_test.yml')
    text = File.read path
    @dishes = YAML.load text
    @dishes = Hash[@dishes.map { |(k, v)| [k.to_sym, v] }]
  end

  def display
    @dishes.dup
  end

  def contains?(item)
    @dishes.include?(item.to_sym)
  end

  def price(item)
    @dishes[item.to_sym]
  end
end
