# require_relative 'order'

class Menu

  attr_reader :panini
  PANINI = {
    item_number:  { 'Sandwich' => 'Cost' },
    1 =>          { 'Egg salad' => 7 },
    2 =>          { 'The Dagwood' => 12 },
    3 =>          { 'The Caprese' => 7 },
    4 =>          { 'Ham and cheese' => 9 },
    5 =>          { 'The Jibarito' => 8 },
    6 =>          { 'Bologna sandwich' => 8 },
    7 =>          { 'Grilled cheese' => 7 },
    8 =>          { 'The Vegan' => 7 }
  }

  def initialize(panini = PANINI)
    @panini = panini
  end

  def display_menu
    @panini.each do |k, v|
      puts "#{k} - #{v.keys[0]} - #{v.values[0]}"
    end
  end

end
