class Menu

attr_reader :display_menu

  def initialize(menu = :pizza => 6.00, :burger => 7.00, :katsuwrap => 4.50, :curry => 5.50)
    @menu = menu
  end

  # def food_menu
  #     {:Pizza => 6.00,
  #     :Burger => 7.00,
  #     :Katsuwrap => 4.50,
  #     :Curry => 5.50 }
  #   end

    def display_menu
      p @menu
    end
  end
