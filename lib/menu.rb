class Menu
  def initialize
    hello
    dishes
  end

  def dishes
    @dishes =
    [
      { name: '1 Burger', price: 10.99 },
      { name: '2 Pizza', price: 14.99 },
      { name: '3 Salad', price: 7.99 },
      { name: '4 fries', price: 2.99 }
    ]
  end

  def hello
    puts 'Welcome to The Greasy Diner'
    puts 'please make your selection:'
  end
end