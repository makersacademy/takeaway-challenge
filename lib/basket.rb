class Basket
  def initialize
    @in_basket = []
    @total = 0.0
  end

  def add_to_basket(dish)
    # @inbasket << dish
  end

  def remove_from_basket(dish)
    # @inbasket.delete(dish)
  end

  def view_basket()
    # => str: formatted list
  end

  def get_total()
    # => str: formatted total
  end

  def goto_checkout(basket = self, checkout=Checkout)
    # @checkout = checkout.new(basket)
  end

  private
  def add_to_total(amount)
    # @total += amount
  end

  def deduct_from_total(amount)
    # @total -= amount
  end
end