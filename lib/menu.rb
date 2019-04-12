class Menu

  attr_reader :dishes, :order, :quantity

  def initialize
    @dishes = [{ name: "Pizza", price: 6.00 },
      { name: "Pasta", price: 8.00 },
      { name: "Chips", price: 3.00 },
      { name: "Burger", price: 10.00 },
      { name: "Lobster", price: 25.00 },
      { name: "Oysters", price: 20.00 }]
    @order = []
    @quantity = []
  end

  def take_order(item)
    @order << item
  end

  def quantities
    @order.map {|item| item[:price]}
    # @quantity << @order.count("Pizza")
    # @quantity << @order.count("Pasta")
    # @quantity << @order.count("Chips")
    # @quantity << @order.count("Burger")
    # @quantity << @order.count("Lobster")
    # @quantity << @order.count("Oysters")
  end

end
