require_relative 'menu.rb'

class Takeaway

  def initialize(menuclass = Menu)
    @menuclass = menuclass
  end

  def show_menu
    menu = @menuclass.new
    menu.display
  end

end
