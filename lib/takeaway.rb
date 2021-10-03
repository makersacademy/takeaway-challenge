require_relative 'menu'

class Takeaway

  def initialize(menu_object = Menu.new)
    @menu_object = menu_object
  end

  def menu
    @menu_object.list
  end

  def add_item(name, cost)
    @menu_object.add(name, cost)
  end

end
