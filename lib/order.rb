class Order

  attr_reader :selection, :shopping_cart

  def initialize
    @selection = { number: nil, quantity: nil }
    @shopping_cart = []
  end

  def select_items(number, quantity)
    @selection = { number: number, quantity: quantity }
    add_selection_to_order
    output_selection
    @selection = { number: nil, quantity: nil }
  end

  def add_selection_to_order
    @shopping_cart << @selection
  end

  def output_selection
    "You have selected #{selection[:number].to_s} order(s) of number #{selection[:number].to_s}"
  end

end
