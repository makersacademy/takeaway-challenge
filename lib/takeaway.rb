require './docs/menu'

# knows how to take an order from the customer
class TakeAway
  attr_reader :menu

  def initialize(menu = MENU)
    @menu = menu
  end

end
