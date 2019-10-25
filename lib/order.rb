class Order

  attr_reader :menu
  attr_accessor :selection

  DEFAULT_MENU = {
    coffee: 3,
    burger: 7
  }

  def initialize(menu = DEFAULT_MENU)
    @menu = menu
    @orders = []
  end

  def select_dishes(selections, quantity)
    @selection = []
    @selection += [selections, quantity]
  end

  def order_total

  end

end
