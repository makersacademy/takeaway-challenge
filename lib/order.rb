class Order

  attr_reader :menu

  def initialize(menu_class=Menu)
    @menu = menu_class.new
    @basket = []
  end

  def basket
    @basket.dup.freeze
  end

  def place_order(*dishes, total)
    dishes.each { |dish| @basket << @menu.find_price(dish) }
    @basket = @basket.flatten
  end

  def total
    price = 0
    @basket.each {|dish| price += (dish[:amount] * dish[:price])}
    price
  end
end
