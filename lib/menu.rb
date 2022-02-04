class Menu

  attr_accessor :menu_import

  def initialize
    @menu_import
  end

  def view_menu
    puts import_menu
  end

  def import_menu
    file = File.open('./menu.txt')
    @menu_import = file.read
  end

end
