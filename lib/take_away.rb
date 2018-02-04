require_relative 'menu'

class TakeAway

  attr_reader :menu,
              :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
  end

  def read_menu
    menu.dishes
  end

  def order(user_input, amount = 1)
    basket_checker(user_input)
    basket << { user_input => amount }
    puts "#{amount}x #{user_input}(s) added you your basket"
  end

  def basket_checker(user_input)
    raise "item not in menu" if !menu.dishes.has_key?user_input
  end


end
