class Order

  attr_reader :selection, :menu, :total

  def initialize(menu)
    @selection = []
    @menu = menu
    @total = 0
  end

  def ordering(dish_number)
    selection << menu.board[dish_number - 1]
  end

  def total_amount
    self.total = 0
    selection.each { |dish| self.total += dish.dish_price }
    total
  end

  private

  attr_writer :total

end
