require_relative 'menu'

class Restaurant

  def view_menu
    Menu.new.see_menu
  end

end
