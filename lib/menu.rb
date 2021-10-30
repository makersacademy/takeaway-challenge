
class Menu
  
  attr_reader :dishes

  def initialize
    @dishes = [
      {name: 'Pizza', price: 10},
      {name: 'Burger', price: 8},
      {name: 'Cake', price: 5},
      {name: 'Salad', price: 3},
      {name: 'Chips', price: 4},
      {name: 'Paella', price: 12}
    ]
  end

  def view_menu
    @dishes.each { |dish, price|
      puts "#{dish[:name]}: £#{dish[:price]}"
    }
  end
end