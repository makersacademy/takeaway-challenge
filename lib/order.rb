class Order
#let customers order a takeaway
  def initialize(checkout = {}, menu = Menu.new)
    @checkout = checkout
    @menu = menu
    @total_price = 0
  end

  # def place_order(item, quantity)
  #     fail "No such dish, please select from the menu" if dish_exists?
  #     checkout.store(item, quantity)
  # end

  private

  attr_reader :checkout

  def dish_exists?

  end

end
