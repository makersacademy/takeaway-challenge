require_relative 'menu'

class Takeaway

  attr_reader :basket

  def initialize
    @menu = Menu.new
    @basket = []
  end

  def display(menu)
    menu.items
  end

  def add_to_basket(item, quantity)
    quantity.times { @basket << item }
  end

end
