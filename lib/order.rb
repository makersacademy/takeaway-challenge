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
    raise "This dish is not on the menu" if not_on_menu(item)
    update_basket(item, quantity) if order_includes?(item)
    @basket[item] = quantity if !order_includes?(item)
  end

  private

  def order_includes?(item)
    @basket.each do |dish, quantity|
      return true if dish == item
    end
    false
  end

  def not_on_menu(item)
    !@menu.includes?(item)
  end

  def update_basket(item, quantity)
    quantity = @basket[item] + quantity
    @basket[item] = quantity
  end

end
