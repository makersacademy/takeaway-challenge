require_relative 'menu'

class Restaurant
  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu.menu
  end

  def bill(basket)
    total = 0
    basket.each { |key, value|
      total += (value * @menu[key])
    }
    total
  end

end
