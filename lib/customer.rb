class Customer

  def initialize
    @order = []
  end

  def choose(quantity, dish)
    quantity.times do
      @order << dish
    end
  end

  def order
    @order
  end

end