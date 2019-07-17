require 'dish'
class Menu

  def initialize(dishes = [])
    @dishes = dishes
  end

  def view
    menu_items = ""
    @dishes.map { |dish| menu_items+="#{dish.name} - £#{'%.2f' % dish.price}\n" }
    print menu_items
    menu_items
  end

end
