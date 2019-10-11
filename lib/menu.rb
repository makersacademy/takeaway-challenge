require 'dish'

class Menu

  def initialize(dishes = [])
    @dishes = dishes
  end

  def view
    menu_list = ""
    @dishes.map { |dish| menu_list += "#{dish.name} - £#{'%.2f' % dish.price}\n" }
    print menu_list
    menu_items
  end
end
