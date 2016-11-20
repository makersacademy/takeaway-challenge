class Menu
  attr_reader :list, :basket, :grand_total

  MENU = { margherita: 6,
          pepperoni: 8,
          hawaiian: 7,
          four_seasons: 7,
          garlic_bread: 3,
          olives: 2 }
  def menu
    MENU
  end
end
