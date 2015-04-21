class Menu
  def initialize
    hello
    dishes
  end

  def dishes
    @dishes =
      { name: 'Burger', price: 10.95 },
      { name: 'Pizza', price: 14.00 },
      { name: 'Salad', price: 7.60 },
      { name: 'fries', price: 2.90 }
  end

  def hello
    puts 'Welcome to The Greasy Diner'
    puts 'please make your selection:'
  end
end