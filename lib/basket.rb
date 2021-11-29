class Basket
  attr_reader :in_basket, :total
  def initialize
    @in_basket = []
    @total = 0.0
  end

  def add_to_basket(dish)
    @in_basket << dish
    add_to_total(dish.price)
  end

  def remove_from_basket(dish)
    @in_basket.delete(dish)
    deduct_from_total(dish.price)
  end

  def view_basket()
    # => str: formatted list
  end

  def get_total()
    # => str: formatted total
  end

  ## Need to think about how best to implement this
  def goto_checkout(basket = self, checkout=Checkout)
    # @checkout = checkout.new(basket)
  end

  private
  def add_to_total(amount)
    @total += amount
  end

  def deduct_from_total(amount)
    @total -= amount
  end
end