class Menu

  attr_reader :dishes

  def initialize
    @dishes = { "Chicken Korma"  => 5,
                "Lamb Madras"    => 6,
                "Prawn Vindaloo" => 7,
                "Pilau Rice"     => 2,
                "Garlic Nan"     => 3,
                "Papadom"        => 1 }
  end

  def price
    dishes.each do | dish, price |
      "#{ dish }: £#{ price }"
    end
  end

  def display_menu
    dishes.each do | dish, price |
      "#{ dish }: £#{ price }"
    end
  end

end