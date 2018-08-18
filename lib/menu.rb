class Menu

attr_reader :menu_list

  def initialize(menu_list)
    @menu_list = menu_list
  end

  def view_menu
    @menu_list
  end
end
