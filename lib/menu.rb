

class Menu

attr_reader :menu

  MENU = { Paella: 7,
         Rissotto: 8,
         Octopus: 15,
         Salad: 6,
         Wine: 4
          }

  def initialize(menu=MENU)
    @menu = menu
  end

  def print_menu
    MENU.each_with_index do |(dish, price), index|
      puts " #{index + 1}. #{dish}: £ #{price}."
    end
  end

end
