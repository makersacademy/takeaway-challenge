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
    @orders << { meal: selections.to_s, quant: quantity, total: (@menu[selections.to_sym] * quantity) }
    return "Thank you for your order. The total cost is #{}"
  end

end
