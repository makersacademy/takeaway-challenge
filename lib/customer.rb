require "menu"

class Customer

  def initialize(name = "John Doe")
    @name = name
    @menu = Menu.new
  end

  def request_menu
    menu.request_menu
  end

end
