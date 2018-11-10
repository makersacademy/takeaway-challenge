class Order

  attr_reader :basket, :menu

  def initialize(menu)
    @menu = menu
    @basket = []
  end

  def add(item)
    @menu.list.each do |dish, price|
      @basket << [dish, price] if item == dish
    end
  end
end
