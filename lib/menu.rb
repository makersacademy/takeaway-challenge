class Menu

  attr_reader :the_menu

  def initialize
    @the_menu = {"Charsui pork" => 5, "Choisum" => 3, "Drink" => 1}
  end

  def print_menu
    @the_menu.each_with_index do |(key, val), ind|
      puts "#{ind+1}: #{key} -- £#{val}"
    end
  end

end
