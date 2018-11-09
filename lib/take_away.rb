class Takeaway
  attr_reader :pricelist

  def initialize
    @pricelist = []
  end

  def show_price_list
    @price_list = [
      { name: "Jacket Potato (plain)", price: "£1.00" },
      { name: "Jacket Potato with cheese", price: "£1.50" },
      { name: "Jacket Potato with Tuna", price: "£2.00" },
      { name: "Spaghetti Bolognese", price: "£3.50" },
      { name: "Spaghetti Carbonara", price: "£3.00" },
      { name: "Chicken Curry", price: "£5.00" }
    ]
  end
end
