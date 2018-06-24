class Menu
  attr_reader :dishes

  MENU_ITEMS = {
    pasta:  1.99,
    pizza:  4.00,
    salad:  2.99,
    fries:  0.99
  }

  def initialize(dishes = MENU_ITEMS)
    @dishes = dishes
  end

  def print_dishes
    dishes.map do |item, price|
      "#{item.capitalize} £#{'%.2f' % price}"
    end.join(', ')
  end

  def on_menu?(dish)
    !!dishes[dish]
  end

  def price(dish)
    dishes[dish]
  end

end
