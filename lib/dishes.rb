class Dishes
  def self.list
    [
      new('Chicken Korma', true, 6.85),
      new('Beef Lasagna', false, 6.00),
      new('Spaghetti Bolognese', true, 9.50),
      new('Mac n Cheese', true, 4.50),
      new('Fish & Chips', true, 5.50),
      new('Truffle Gnocchi', false, 12.50),
    ]
  end

  attr_reader :dish_name, :available, :price

  def initialize(name, available, price)
    @dish_name = name
    @available = available
    @price = price
  end
end
