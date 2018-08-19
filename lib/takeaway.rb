class Takeaway

  attr_reader :menu

  def initialize(menu)
    @menu = menu
  end


  def view_menu(menu)
    menu.print_menu
  end



end
