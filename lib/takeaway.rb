class Takeaway
  attr_reader :name, :price, :order

  @MENU = [
    { name: "Cod", price: 6 },
    { name: "Haddock", price: 6 },
    { name: "Plaice", price: 6 },
    { name: "Chips", price: 2 },
    { name: "Sausage", price: 3 }
  ]

  def initialize(name, price)
    @order = true
  end
end