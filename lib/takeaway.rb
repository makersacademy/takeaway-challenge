
class Takeaway
  attr_reader :menu

  def initialize
    @menu = [{ dish: nil, price: nil }]
  end

  def see_menu
    [
    { dish: "Burger", price: 12 },
    { dish: "Salad", price: 14 },
    { dish: "Pie", price: 16 },
    { dish: "Sausage", price: 12 },
    { dish: "Pasta", price: 11 },
    { dish: "Tacos", price: 14 },
    { dish: "Soup", price: 13 },
]
  end
end
