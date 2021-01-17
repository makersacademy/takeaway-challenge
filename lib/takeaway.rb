require_relative 'menu'

class Takeaway
attr_reader :menu, :basket

  def initialize
    @menu = Menu.new
    @basket = {}
  end

  def read_menu
    @menu
  end

  def order(food_item)
    @food_item = food_item
    
  end

  def add
  end

  def basket_summary
  end

  def total
  end

end