require_relative 'menu'

class Order

  def initialize(menu = Menu.new)
    @basket = {}
    @menu = menu
  end

  def basket
    @basket
  end

  def add(item)
    if @menu.includes?(item)
      @basket[item] = @menu.dishes[item]
    else
      raise "This dish is not on the menu"
    end
  end

end
