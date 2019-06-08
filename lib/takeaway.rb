class Takeaway

  def initialize
    @selection = []
  end

  def menu
    [
      { dish: "DAIFUKU", price: 2 },
      { dish: "ICHIGO", price: 3 }
    ]
  end

  def select(item, qty)
    @selection << { dish: item, qty: qty }
  end
end
