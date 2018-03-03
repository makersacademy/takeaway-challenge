class Order

  def initialize(menu=Menu.new)
    @menu = menu
  end

  def show_menu(puts_out)
    @menu.print(puts_out)
  end

end
