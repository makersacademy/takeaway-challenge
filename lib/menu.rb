class Menu

attr_reader :pizza_menu, :list_menu

  def list_menu
    pizza_menu =
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
    puts pizza_menu
  end

end
