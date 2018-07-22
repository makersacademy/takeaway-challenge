class Order
  attr_reader :menu, :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @total = []
  end

  def add_to_basket(item)
    @basket << item
  end

  def remove_from_basket(item)
    @basket.delete(item)
  end


end