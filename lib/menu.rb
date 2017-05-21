class Menu
  attr_reader :menu

# TODO remove this menu
  def initialize
    @menu = { :starters => starters(),
              :main_course => main_course(),
              :dessert => dessert() }
  end

  def starters
    { 1 => { "Olives" => 4 }, 2 => { "Pitta bread" => 5 } }
  end

  def main_course
    { 3 => { "Fried duck" => 12 }, 4 => { "Fish & Chips" => 9 } }
  end

  def dessert
    { 5 => { "Jam roll" => 5 }, 6 => { "Apple crumble" => 6 } }
  end
end
