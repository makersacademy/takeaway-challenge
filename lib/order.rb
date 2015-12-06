class Order

  attr_reader :menu, :basket

  def initialize(menu)
    self.menu = menu
    self.basket = Hash.new(0)
  end

  def show_basket
    return 'Basket is empty' if basket.empty?
    pretty_print_basket
  end

  def add(dish, quantity)
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

  def pretty_print_basket
    msg = ''
    basket.each { |k, v| msg << "#{v}x #{k}(s)\n"}
    msg
  end
end
