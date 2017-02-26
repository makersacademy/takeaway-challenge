class Menu

  attr_reader :menu

  def restaurant_menu
    @the_menu = {"Charsui pork" => 5, "Choisum" => 3, "Drink" => 1}
    print_menu(@the_menu) # instance variable only created to test from outside
  end

  def print_menu(the_menu)
    the_menu.each_with_index do |(key, val), ind|
      puts "#{ind+1}: #{key} -- £#{val}"
    end
  end

end
