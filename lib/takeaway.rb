class Takeaway

  attr_reader :basket

  def initialize(basket_class=Basket, menu_class=Menu)
    @basket = basket_class.new
    @menu = menu_class.new
  end

  def add(*dishes)
    dishes
  end

end
