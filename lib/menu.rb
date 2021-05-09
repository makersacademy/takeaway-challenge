class Menu

  attr_reader :dishes

  DEFAULT_MENU = {
    pita: 2.50,
    dolmades: 6.50,
    musaka: 7.99,
    zazzikki: 4.99
  }

  def initialize(dishes = DEFAULT_MENU)
    @dishes = dishes
  end 

  def view_menu
    @dishes.map { |dish, price| "#{dish.to_s.capitalize}: £#{'%.2f' % price}"}.join(',')
  end

  def price(dish)
    @dishes[dish]
  end 
end
