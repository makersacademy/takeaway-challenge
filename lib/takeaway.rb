require_relative 'menu'

class Takeaway

  attr_reader :menu, :basket

  def initialize
    @menu = Menu.new
    @basket = []
  end

  def read_menu
    @menu.print_menu
  end

  def order(menu_item, amount=1)
    individual_item = {:item => menu_item, :amount => amount}
    @basket << individual_item
  end

end
