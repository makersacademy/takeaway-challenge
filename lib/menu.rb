class Menu

  attr_reader :menu

  MENU = [
    {dish: 'Fish',     price: 9},
    {dish: 'Curry',    price: 9},
    {dish: 'Rice',     price: 3},
    {dish: 'Steak',    price: 10},
    {dish: 'Soup',     price: 7},
    {dish: 'Sandwich', price: 3},
    {dish: 'Squirrel', price: 100}
  ]

  def display
    MENU.each { |element| puts "#{element[:dish]}, #{element[:price]}" }
  end

  def menu
    MENU
  end
end