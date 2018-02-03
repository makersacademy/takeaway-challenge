require_relative 'menu'

class Order

  def initialize(menu = Menu.new)
    @basket = {}
    @menu = menu
  end

  def basket
    @basket
  end

  def add(item, quantity = 1)
    if @menu.includes?(item) && !order_includes?(item)
      @basket[item] = quantity
    elsif @menu.includes?(item) && order_includes?(item)
     quantity = @basket[item] + quantity
     @basket[item] = quantity
    else
      raise "This dish is not on the menu"
    end
  end

  def order_includes?(item)
    @basket.each do |dish, quantity|
      return true if dish == item
    end
    false
  end

end
