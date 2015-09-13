class Menu

  attr_reader :menu

  def initialize
    @menu = {}
  end

  def make_dish_available(dish)
    number = next_dish_number
    @menu[number] = dish
  end

  def view
    fail "No dishes available on this menu" if no_dishes_available?
    menu.each do |k, v|
      puts "#{k}: #{v.name} | Price: £#{'%.2f' % v.price}"
    end
  end

  def select(dish_number)
    fail "No dishes available on this menu" if no_dishes_available?
    fail "There are no dishes matching the number given" unless valid_order_number?(dish_number)
    menu[dish_number]
  end

  private

  def no_dishes_available?
    menu.count == 0
  end

  def valid_order_number?(number)
    menu.keys.include?(number)
  end

  def next_dish_number
    return 1 if no_dishes_available?
    menu.keys.max + 1
  end

end