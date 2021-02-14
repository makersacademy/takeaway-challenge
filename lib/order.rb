require_relative 'menu'

class Order

  attr_reader :basket

  def initialize
    @menu = Menu.new
    @basket = []
  end

  def read_menu
    @menu.menu
  end

  def add(name, amount)
    @basket << { name => amount }
  end

end
