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

  def add_to_basket(dish:, quantity:)
    dish_valid?(dish, quantity)
    @basket.add(dish, quantity)
  end

  def checkout
    raise "nothing in your basket, bruh" if @basket.details.empty?
    @checkout.order_confirmation?(@basket.details)
    empty_basket
  end

  def empty_basket
    @basket.empty
  end

  private
  
  def dish_valid?(dish, quantity)
    raise "food is not on menu, bruh" if !@menu.dish_exists?(dish)
    raise "not enough available to fulfill your order." if !@menu.dish_available?(dish, quantity)
  end

  # def order_on_menu?(dish)
  #   @menu.list.map { |item|
  #     return true if item[:name] == dish }
  #   false
  # end
end
