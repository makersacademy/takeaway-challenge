require_relative 'menu'

class Takeaway
  attr_reader :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = Hash.new(0)
  end

  def show_menu
    @menu.show
  end

  def order(item, quantity = 1)
    @basket[item] += quantity
  end

end
