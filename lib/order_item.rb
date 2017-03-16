class OrderItem

  attr_reader :name, :quantity, :price

  def initialize(name:, quantity: 0, price: 0)
    @name = name
    @quantity = quantity
    @price =  price
  end

end
