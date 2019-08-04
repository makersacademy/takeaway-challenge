class Order
  
  attr_reader :menu, :checkout

  def initialize
    @menu = Menu.new
    @total = []
    @basket = []
  end

  def add_dish(dish, quantity)
    quantity.times { @total << menu.dishes.fetch(dish) }
    basket << "#{dish}"
  end

  def view_order

  end

end   

# Responsible for the ordering process.