class Restaurant

  attr_reader :menu

  def initialize
    @menu = []
  end

  def make_dish_available(dish)
    @menu.push(dish)
  end

  def view_menu
    fail "No dishes available on this menu" if no_dishes_available?
    menu_string = ""
    menu.each_with_index do |dish, index|
      menu_string << "#{index+1}: #{dish.name} | Price: £#{'%.2f' % dish.price}\n"
    end
    menu_string
  end

  def select(dish_number)
    fail "No dishes available on this menu" if no_dishes_available?
    index = dish_number - 1
    fail "There are no dishes matching the number given" unless valid_order_number?(index)
    menu[index]
  end

  private

  def no_dishes_available?
    menu.count == 0
  end

  def valid_order_number?(number)
    !!menu[number]
  end

end