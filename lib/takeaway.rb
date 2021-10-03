require_relative 'menu'

class Takeaway

  def initialize(menu_object = Menu.new)
    @menu_object = menu_object
    @choice = []
  end

  def menu
    @menu_object.list
  end

  def add_item(name, cost)
    @menu_object.add(name, cost)
  end

  def pick(item)
    @choice << @menu_object.list.select do |menu_item|
      menu_item.name == item
    end[0]
  end

  def display_picks
    @choice
  end

end
