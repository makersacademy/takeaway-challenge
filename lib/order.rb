class Order

  attr_reader :selection

  def initialize
    @selection = { number: nil, quantity: nil }
    @order = []
  end

  def select_items(number, quantity)
    @selection = { number: number, quantity: quantity }

  end

end
