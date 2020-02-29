class Menu

  attr_reader :menu

  def initialize
    # Dish.new('pizza', 10.50), Dish.new('curry', 8.00), Dish.new('burger', 6.50)
    #@menu = create_menu
    @menu = [
      { name: 'pizza', price: 10.50 },
      { name: 'curry', price: 8.00 },
      { name: 'burger', price: 6.50 }
    ] # I think, in reality, the menu would be loaded from a server
  end

  def display
    @display = []
    @menu.each.with_index { |item, i| @display.push([i + 1, item[:name], item[:price]]) }
    @display
  end
#@display.push([i, item[:name], item[:price]]
  # def create_menu
  #   @menu = [
  #     Dish.new('pizza', 10.50),
  #     Dish.new('curry', 8.00),
  #     Dish.new('burger', 6.50)
  #   ]
  # end
end
