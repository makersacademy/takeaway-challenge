class Takeaway

  def initialize(menu, printer)
    @menu = menu
    @printer = printer
  end

  def show_menu
    @printer.print(@menu.pretty_dishes)
  end

end