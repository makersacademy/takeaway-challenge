require 'csv'

class Menu

  def initialize(menu_filename = './resources/menu_list.csv')
    @menu_filename = menu_filename
  end

  def show_menu
    CSV.read(@menu_filename)
  end

end
