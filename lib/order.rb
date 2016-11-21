require_relative 'menu'
class Order

attr_reader :dishes

  def initialize(menu_klass)
    @menu = menu_klass.new
    @dishes = {}
  end

  def add(dish, quantity)
    fail "#{dish} not on the menu!" unless menu.has_dish?(dish)
    dishes[dish] = quantity
  end

  def total
    item_total.inject(:+)
  end


  def item_total
    dishes.map do |dish, quantity|
      menu.price(dish) * quantity
    end
  end
    private

    attr_reader :menu

end
