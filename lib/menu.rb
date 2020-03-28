require_relative 'menu_item'

class Menu

  attr_reader :list

  def initialize
    @list = Hash.new
  end

  def add_new_item(name, price)
    @list[name] = MenuItem.new(name, price)
  end
end
