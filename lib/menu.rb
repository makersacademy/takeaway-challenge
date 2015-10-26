class Menu
  attr_reader :MENU

  MENU = { "hotdog"=>1.99,
          "cheesebuger"=>1.49,
          "Hamburger"=>0.99,
          "Fries"=>0.89, }

    def initialize(menu = MENU)
      @menu = menu
    end

    def read_menu
      MENU
    end
end
