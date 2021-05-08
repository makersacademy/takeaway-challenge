class Menu

  attr_reader :items

  DEFAULT_MENU = {
    pita: 2.50,
    dolmades: 6.50,
    musaka: 7.99,
    zazzikki: 4.99
  }


  def initialize(items = DEFAULT_MENU)
    @items = items
  end 

  def display
    @items.map { |dish, price| "#{dish.to_s.capitalize}: £#{'%.2f' % price}"}.join(',')
  end

end 