class Menu

attr_reader :display_menu

  def food_menu
      {'Pizza' => 6.00,
      'Burger' => 7.00,
      'Katsu Wrap' => 4.50,
      'Curry' => 5.50 }
    end

    def display_menu
      p food_menu
    end
  end
