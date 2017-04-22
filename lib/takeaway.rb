require_relative 'menu'

class Takeaway

  attr_reader :menu, :basket

  def initialize
    @menu = Menu.new
    @basket = []
  end

  def read_menu
    menu.list_dishes
  end

  def order(item, quantity=1)
    quantity.times {self.basket << item }
  end

end
