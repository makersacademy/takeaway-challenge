class Menu
  def initialize
    hello
    dishes
  end

  def dishes
    @dishes =
    [
      { name: 'Burger', price: 10 },
      { name: 'Pizza', price: 14 },
      { name: 'Salad', price: 7 },
      { name: 'fries', price: 2 }
    ]
  end

  def hello
    puts 'Welcome to The Greasy Diner'
    puts 'please make your selection:'
  end
end