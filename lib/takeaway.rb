require_relative 'menu'

class Takeaway

  attr_reader :menu, :food_item, :basket

  def initialize
    @menu = Menu.new
    @basket = []
  end

  def read_menu
    menu.list_dishes
  end

  def order(item)
    self.food_item = item
    self.basket << item
  end


  private
  attr_writer :food_item

end
