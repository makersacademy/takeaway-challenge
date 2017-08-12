require 'csv'

class Creating_menu

  attr_accessor :menu_hash

  def initialize
    @menu_hash = {}
  end

  def hash_of_menu
    @menu_hash = {
    "Plastic fried virus skin": 9.99,
    "Birdpeople egg with dehydrated watermelon": 88.67,
    "Shredded concreate in amigdila": 4.99,
    "Cockroach-wing encapsulated microchip": 7.90,
    "Extra powdered rocket": 2.99,
    "Ninja squirrel rolled in plastic-bag": 4.67}
  end

  def putting_hash_into_file
    self.hash_of_menu
    CSV.open("menu.csv", "w") do |newfile|
      @menu_hash.each do |pair|
        newfile.puts pair
      end
    end
  end
end
