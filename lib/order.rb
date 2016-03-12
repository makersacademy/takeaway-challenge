class Order

  attr_reader :basket, :price

  def initialize(menu = Menu.new)
    @basket = []
    @menu = menu
    @price = 0
  end

end
