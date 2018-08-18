class Order

  def initialize(menu = Menu.new)
    @menu = menu
    @order = []
    @price = 0
    user_input = ''
  end

  def add_item(name, quantity)
  end

end
