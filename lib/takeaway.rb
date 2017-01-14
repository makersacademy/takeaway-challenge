require_relative 'menu'

class Takeaway
attr_reader :menu_object
# , :menu_array

  def initialize
    @menu_object = Menu.new
  end

  def add_dish(name, price)
    @menu_object.add(name, price)
  end

  def show_menu
    @menu_object.show_menu_array
  end

end
