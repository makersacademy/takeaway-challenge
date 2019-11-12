class Menu

  attr_reader :menus

def initialize
  @menus = {"vegetable curry" => 12, "California Roll" => 4, "Edemame" => 2, "Burrata" => 6, "Tricolore Salad" => 10}
end

def display_menu
  @menus.each {|key, value|
  puts "#{key} : £#{value}"}
end
end
