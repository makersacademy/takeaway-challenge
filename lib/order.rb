require './lib/takeaway'

class Order

  attr_accessor :basket, :current_selection

  DEFAULT_QUANTITY = 1

  def initialize
    @basket = []
  end

  def select_item(item, quantity = DEFAULT_QUANTITY)
    @current_selection = {}
    self.current_selection[:item] = item
    self.current_selection[:qty] = quantity
    add_to_basket(self.current_selection)
    "#{quantity}x #{item} added to your basket"
  end

  def add_to_basket(current_selection)
    self.basket << current_selection
  end

  def place_order
    Takeaway.new(SMS).accept_order(self.basket, total)
  end

end
