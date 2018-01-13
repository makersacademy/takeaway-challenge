class Menu

  attr_reader :basket

    MENU = [
      {},
      {"tuna soaked nut butter": 2.00},
      {"sweaty eel sausage": 2.50},
      {"microwaved xmas crab": 3.00},
      {"easy peasy hot & eely cheesy balls": 3.50},
      {"Kenny Loggins' mackeral tagine": 9.00},
      {"chubby tea bags": 1.50},
      {"mushed tadpole burrito": 6.00},
      {"cod monsieur": 6.50},
      {"steamy bream hot box": 6.25},
      {"fishy goods and services": 7.00},
      {"muddy fish-finger aeoli": 1.00},
      {"hot pollacks": 4.00},
      {"scaley protein shake": 5.00},
      {"freaky lamp fish": 10.00},
      {"code smells": 0.50}
    ]

  def initialize
    @basket = []
  end

  def viewmenu
    MENU[0..15].map { |food| food.each { |key, value| puts "#{key}, £#{value}0" } }
  end

  def order(food, quantity)
    quantity.times {@basket << MENU[food]}
    "You added #{MENU[food].keys[0]} #{quantity} time(s)!"
  end

end
