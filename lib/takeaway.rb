class Takeaway

  attr_reader :menu, :basket

  def initialize
    @menu = Dishes.new
    @basket = 0
  end

  def print_menu
    @menu.list
  end

  def select_dish(dish)

  end





end
