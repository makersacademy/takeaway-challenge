class Takeaway
  def initialize(name: "Random Takeaway", menu: Menu.new, basket: Basket.new, checkout: Checkout.new)
    @name = name
    @menu = menu
    @basket = basket
    @checkout = checkout
  end
  
  def show_menu
    @menu.print
  end

  def show_basket
    @basket.print
  end

  def add_to_basket(dish, quantity)
    @basket.add(dish, quantity)
  end

  def checkout
    @checkout.order_confirmation?(@basket.details)
  end
end
