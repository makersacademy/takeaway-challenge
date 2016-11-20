require './lib/takeaway'

class Order

  attr_accessor :basket, :current_selection

  DEFAULT_QUANTITY = 1

  def initialize
    @basket = []
  end



end
