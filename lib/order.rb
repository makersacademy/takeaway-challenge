class Order
  attr_reader :items

  def initialize(menu = Menu.new)
    @items = []
    @menu = menu
    @menu_items = menu.dishes
  end

  def add_item(dish, quantity = 1)
    item = @menu_items.select { |item| item[:name] == dish }
    item = item.first
    item[:quantity] = quantity
    @items << item
  end
end
