require_relative 'menu.rb'

class Takeaway

  def show_menu
    menu_person = Menu.new
    menu_person.list
    @menu = menu_person.food_list
  end
end
