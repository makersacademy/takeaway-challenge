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

  def order(food_choice)
    @selection << food_choice
  end

  def order_confirmation
    @selection.join(", ")
  end

  def total
    @selection.sum(&:to_f)
  end

#What was intended next was to have the order confirmation
#and total combined and displayed. The tests all pass up
#until this point.

end
