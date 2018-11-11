class Menu
  attr_reader :menu

  MENU = { "Ruby's Salad" => 6,
           "Matz 'n' Cheese" => 8,
           "Makers Triple Burger" => 10,
           "Python's Steak" => 12 }

  def initialize(menu = MENU)
    @menu = menu
  end

  def show
    @menu.each { |dish, price| puts "#{dish}: £#{price}" }
  end

  def available?(dish)
    !@menu[dish].nil?
  end

end
