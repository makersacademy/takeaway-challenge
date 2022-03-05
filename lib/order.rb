class Order

  attr_accessor :basket
  
  MENU = [
    {:cod => 8.0},
    {:haddock => 8.50},
    {:rock_salmon => 11.25},
    {:jumbo_battered_sausage => 8.0},
    {:mini_battered_sausage => 6.50},
    {:cod_fish_cake => 7.50},
    {:salmon_fish_cake => 9.50},
    {:pukka_pie => 7.75},
    {:large_chips => 4.50},
    {:regular_chips => 3.25},
    {:curry_sauce => 0.95},
    {:gravy => 0.95},
    {:bread_roll => 1.50}
  ]

  def initialize
    @basket = []
  end

  def view_menu
    MENU
  end

end