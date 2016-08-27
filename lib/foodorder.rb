require_relative 'selection'

class FoodOrder
  attr_reader :selection, :quantity, :price

  def initialize(selection, quantity, price)
    @selection = selection
    @quantity = quantity
    @price = price
  end
end
