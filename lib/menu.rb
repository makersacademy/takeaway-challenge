require_relative 'menu_item'

class Menu

  attr_reader :list

  def initialize
    @list = Hash.new
  end

  def add_new_item(name, price)
    @list[name] = MenuItem.new(name, price)
  end

  def print_menu
    @list.map { |_key, value| 
      "#{value.name} - £#{value.price}" 
    }
  end

  def return_item(key)
    @list.values_at(key) 
  end
end
