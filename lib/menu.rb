class Menu

  attr_reader :menu

  def initialize
    @menu = [
      {number: 1, dish: "Green Curry", price: 9 },
      {number: 2, dish: "Red Curry", price: 9 },
      {number: 3, dish: "Stir Fry", price: 7 },
      {number: 4, dish: "Pad Thai", price: 6 },
      {number: 5, dish: "Chicken Wings", price: 4 },
      {number: 5, dish: "Spring Rolls", price: 4 },
      {number: 5, dish: "Tom Yum Soup", price: 5 }]
  end

end
