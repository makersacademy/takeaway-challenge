class Menu

    MENU = {
        :Soup => 6.00,
        :Meat => 10.00,
        :Chicken => 8.00,
        :Bruschetta => 5.00,
        :Hummus => 5.00,
        :Halloumi => 5.00,
        :Coke => 2.00,
        :Juice => 2.00,
        :Beer => 1.50,
        :Wine => 6.00
    }

    def initialize(menu = MENU)
      @menu = menu
    end
end
