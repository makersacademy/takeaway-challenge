class Menu
  MENU = [{name: "Lasagna", price: 8},
          {name: "Chicken burger", price: 7},
          {name: "Chicken wings", price: 6},
          {name: "Pizza Vesuvio", price: 9}]

  def print_dishes
    MENU.each { |dish| puts "#{dish[:name]}: £#{dish[:price]}" }
  end
end
