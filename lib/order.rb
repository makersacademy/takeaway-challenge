class Order

  attr_reader :menu

  def initialize(menu_class=Menu)
    @menu = menu_class.new
    @basket = []
  end

  def basket
    @basket.dup.freeze
  end

  def place_order(*dishes, given_total)
    @basket = dishes.each { |dish| dish[:price] = @menu.price(dish) }
    raise 'Re-calculate the total price' unless given_total == total
  end

  def total
    price = 0
    @basket.each {|dish| price += (dish[:amount] * dish[:price])}
    price
  end
end
