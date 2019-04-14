class Takeaway

  attr_reader :menu, :selection

  def initialize
    @menu = { burger: 5.00,
      steak: 45.00,
      chips: 3.00,
      strawberry_milkshake: 4.50,
      kids_meal: 3.30 }

    @selection = []
  end

  def display_menu
    @menu
  end

  def order(menu)
    @selection << menu
  end

  def order_confirmation
    @selection.join(", ")
  end

end
