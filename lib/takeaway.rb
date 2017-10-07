class Takeaway

  attr_reader :menu

  def initialize
    @menu = Dishes.new
  end

  def print_menu
    @menu.list
  end

  def select_dish(dish)

  end

end
