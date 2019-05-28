class Menu
  attr_reader :see_menu
  def initialize
    @see_menu = [
      {item: "chicken", price: 5},
      {item: "bread", price: 3},
      {item: "cheese", price: 3}
    ]
  end

  # def order(item,price, checkout = Checkout.new)
  #  @checkout.basket << {food:item, cost:price}
  # end

end
