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
    readable_menu
  end

  def select(dish_number)
    fail 'No dishes available on this menu' if no_dishes_available?
    index = dish_number - 1
    error_message = 'There are no dishes matching the number given'
    fail error_message unless valid_order_number?(index)
    menu[index]
  end

  private

  def no_dishes_available?
    menu.count == 0
  end

  def valid_order_number?(number)
    menu[number]
  end

  def readable_menu
    menu.each_with_index.inject('') do |return_string, (dish, index)|
      item = "#{index+1}: #{dish.name} | Price: £#{format('%.2f', dish.price)}\n"
      return_string << item
    end
  end

end