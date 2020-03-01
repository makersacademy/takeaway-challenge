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
    raise "food is not on menu, bruh" if !order_on_menu?(dish)
    @basket.add(dish, quantity)
  end

  def checkout
    @checkout.order_confirmation?(@basket.details)
  end

  private 

  def order_on_menu?(dish)
    @menu.list.map { |item|
      return true if item[:name] == dish }
    false
  end
end
