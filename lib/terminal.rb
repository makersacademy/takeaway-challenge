class Terminal

  attr_reader :menu

  def initialize(menu = MenuPrinter.new)
    @menu = menu.menu.the_menu
  end

  def view_menu
  end

  def order
  end

end
