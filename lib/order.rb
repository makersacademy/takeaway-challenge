class Order

  attr_reader :list, :dish_selection, :quantity, :total

  def initialize
    @list = []
    @total = 0
  end

  def place(dish_selection, quantity)
    @list << { dish_selection: dish_selection, quantity: quantity }
    @dish_selection = dish_selection
    @quantity = quantity
  end

  # def calculate
  #   @total += @list[dish_selection] * quantity
  # end

end
