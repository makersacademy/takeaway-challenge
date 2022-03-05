class Menu
  attr_reader :list
  
  def initialize
    @list = [ 
      { dish: "Pizza", price: 7.49 }, 
      { dish: "Pasta", price: 5.89 }, 
      { dish: "Burger", price: 2.29 }, 
      { dish: "Salad", price: 11.99 },
    ]
  end
end