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

  def order(string, amount=1)
    basket << {string => amount}
    puts "#{amount}x #{string}(s) added you your basket"
  end

end
