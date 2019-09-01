class Dish
  attr_reader :identifier, :description, :available_quantity, :cost

  def initialize(identifier, description, quantity, cost)
    @identifier = identifier
    @description = description
    @available_quantity = quantity
    @cost = cost
  end

  def order(quantity)
    raise "Not enough to fullfil order" if @available_quantity < quantity
    @available_quantity -= quantity
  end

  def available?
    @available_quantity > 0
  end

  def describe
    "#{@identifier.to_s}: #{@description} - £#{'%.2f' % @cost}" 
  end

end
