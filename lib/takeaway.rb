class Takeaway

  attr_reader :menu, :basket

  def initialize(menu_class, order_class)
    @menu = menu.New
    @basket = []
  end

  def read_menu
    menu
  end

  def order(dish)
    basket << dish
  end

  def view_basket
    basket
  end

  def total
    basket.each {|dish| dish.price }

  private

  attr_writer :basket

  def dish_price_totals
    basket.map do |dish|
      dish.price
  end

end
