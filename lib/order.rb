class Order

  attr_reader :menu, :status

  def initialize(menu = Menu::MENU_LIST)
    @menu = menu
    @status = []
  end

  def add(item, quantity = 1)
    quantity.times {@status << @menu.select {|k,v| k == item}}
    "#{quantity}x #{item}(s) added to our order!"
  end

  def trolley
  end

  def checkout
  end

end

# def order_total
# ...
# end
