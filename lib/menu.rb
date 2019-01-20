class Menu
  attr_reader :menu_items

  FOOD = {pizza: 2.99, burger: 3.50, burrito: 4.50, 
  lobster: 50.00}

  def initialize(menu_items = FOOD)
    @menu_items = menu_items
  end

  def print
    puts "Takeout Menu"
    @menu_items.each {|food, price| puts "#{food.capitalize} £#{'%.2f' % price}" }
  end

end
