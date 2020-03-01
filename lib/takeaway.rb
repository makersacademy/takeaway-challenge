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
    price = price(dish)
    @basket.add(dish: dish, ordered: quantity, price: price)
  end

  def checkout
    raise "nothing in your basket, bruh" if @basket.details.empty?
    @checkout.order_confirmation(@basket.details)
    empty_basket
  end

  def empty_basket
    @basket.empty
  end

  private

  def price(dish)
    puts "im here man"
    @menu.list.map{|item| return item[:price] if dish == item[:dish]}
  end
  
  def dish_valid?(dish, quantity)
    raise "food is not on menu, bruh" if !@menu.dish_exists?(dish)
    raise "not enough available to fulfill your order." if !@menu.dish_available?(dish: dish, quantity: quantity)
  end
end
