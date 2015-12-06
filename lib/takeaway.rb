require_relative 'menu'

class TakeAway

  attr_reader :menu, :basket

  def initialize(menu_klass = Menu)
    self.menu = menu_klass.new
    self.basket = Hash.new(0)
  end

  def show_basket
    return 'Basket is empty' if basket.empty?
    pretty_print
  end

  def add_to_basket(dish, quantity = 1)
    fail 'Dish not available' unless menu.has?(dish)
    @basket[dish] += quantity
    msg = "#{quantity}x #{dish}(s) added to the basket"
  end

  def total
    basket.inject(0) { |s, a| s + a[1] * menu.dishes[a[0]] }
  end

  def basket
    @basket.dup
  end

  private

  attr_writer :menu, :basket

  def pretty_print
    msg = ''
    basket.each { |k, v| msg << "#{v}x #{k}(s)\n"}
    msg
  end
end
