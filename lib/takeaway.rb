class Takeaway

  attr_reader :menu, :orders

  def initialize(menu = Menu.new)
    @menu = menu
    @orders = []
  end

  def read_menu(menu)
    menu
  end

end
