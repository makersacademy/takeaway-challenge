class Menu

attr_reader :menu

def initialize
  @menu = {
    "King Prawn Noodles" => 5.80,
    "Chicken Fried Rice" => 3.90,
    "Beef Fried Rice" => 3.90,
    "Duck Fried Rice" => 5.60
  }
end

def print_menu
  @menu.each{|k,v| puts "#{k} - £#{v}0"}
end
end
