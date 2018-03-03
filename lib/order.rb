class Order

  def initialize
    @basket = []
  end

  def selection(menu_item)
    @basket << @menu[menu_item]
  end
end
