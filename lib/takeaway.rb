class Takeaway
  def initialize(menu:) # injecting menu as we don't want to creat menu in takeaway class
    @menu = menu

  end

  def print_menu
    menu.print # calling the menu from the Menu class, menu will handle printing the menu
  end

  private

  attr_reader :menu # making menu accessible
end