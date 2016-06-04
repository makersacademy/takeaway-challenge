# Understands how to display a drinks menu
class Menu
  def initialize
    @drinks = {
      "Espresso": 2,
      "Americano": 3,
      "Macchiato": 2,
      "Mocha": 3,
      "Capuccino": 3,
      "Flat White": 2,
      "Cafe Latte": 3,
      "Chai Latte": 2,
      "Hot Chocolate": 3
    }
  end

  def drinks
    @drinks.dup
  end

  # def read_menu
  #   drinks.each_with_index do |(drink, price), i|
  #     puts "#{ i+1 }: #{ drink }, £#{ price }.00"
  #   end
  # end
end
