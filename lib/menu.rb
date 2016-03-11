class Menu

attr_reader :pizza_menu

  def initialize
    @pizza_menu =
      {'Margherita' => 6,
      'Funghi' => 6,
      'Fiorentina' => 6,
      'Formaggi' => 6,
      'Giardino' => 6,
      'Tropicali' => 7,
      'Reine' => 7,
      'Marino' => 7,
      'Pepporoni' => 7,
      'Carne' => 7,
      }
  end

end
