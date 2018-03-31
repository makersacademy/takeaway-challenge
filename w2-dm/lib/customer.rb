class Customer

  def initialize
    @menu = Menu.new
  end

  def show_menu
    @menu.print
  end
end