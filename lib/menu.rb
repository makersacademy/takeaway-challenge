class Menu
  
  attr_reader :dishes, :selected_dishes

  def initialize
    @dishes = [
      {name: 'Pizza', price: 10},
      {name: 'Burger', price: 8},
      {name: 'Cake', price: 5},
      {name: 'Salad', price: 6},
      {name: 'Paella', price: 12}
    ]

    @selected_dishes = [] #unsure of I'll keep this... 
  end

  def view_menu
    @dishes.each { |dish, price|
      puts "#{dish[:name]}: £#{dish[:price]}"
    }
  end
end