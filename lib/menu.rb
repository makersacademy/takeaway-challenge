class Menu

  attr_reader :board

  def initialize
    @board = []
  end

  def add_dish(dish)
    board << dish
  end

end
