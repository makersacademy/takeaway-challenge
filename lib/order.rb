class Order

  attr_reader :selection, :menu

  def initialize(menu)
    @selection = []
    @menu = menu
  end

  def ordering(dish_number)
    selection << menu.board[dish_number - 1]
  end


end
