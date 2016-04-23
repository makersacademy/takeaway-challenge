class Order

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
  end

  def basket
    @basket.dup
  end

  def select(item, qty = 1)
    qty.times { @basket << @menu.pick(item) }
    @basket
  end


end
