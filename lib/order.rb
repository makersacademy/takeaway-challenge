class Order
  attr_reader :menu, :cart

  def initialize(menu)
    @menu = menu
    @cart= Hash.new(0)
  end

  def add_to_cart(item, quantity = 1)
    fail "Could not add to order: Item not available" unless available?(item)

    @cart[item] += quantity
    "#{quantity} x #{item} added to cart."
  end

  def checkout(cart = @cart)
    sum = 0
    cart.each do | item, quantity|
      sum += (@menu.dishes[item.to_sym] * quantity)
    end
    "Your order has been placed. Total cost is £" '%.2f' % sum
  end


  private


  def available?(item)

    @menu.available?(item)

  end

end
