class Takeaway
  attr_reader :pricelist, :name, :quantity, :prices

  def initialize
    @pricelist = []
    @totals = []
  end

  def show_price_list
    @price_list = [
      { names: "Jacket Potato (plain)", price: 1.00 },
      { names: "Jacket Potato with cheese", price: 1.50 },
      { names: "Jacket Potato with Tuna", price: 2.00 },
      { names: "Spaghetti Bolognese", price: 3.50 },
      { names: "Spaghetti Carbonara", price: 3.00 },
      { names: "Chicken Curry", price: 5.00 }
    ]
  end

  def add_order(names, quantity, prices)
    @name = names.to_s
    @quantity = quantity.to_i
    @price = prices.to_f
    @pricelist = [@name, @quantity, @price]
  end

  def total
    original = @quantity * @price
    @totals << original
    @totals.reduce(:+)
  end
end
