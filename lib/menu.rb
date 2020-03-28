require_relative 'menu_item'

class Menu

  attr_reader :list

  def initialize
    @list = []
  end

  def add_item(item)
    @list << item
  end
end
