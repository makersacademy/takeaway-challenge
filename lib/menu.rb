class Menu

  def initalize
    CHINESE_MENU
  end


  CHINESE_MENU = {
    "Chicken with lemon sauce"  =>  4.00,
    "Chinese Roasted Pork"      =>  4.00,
    "Chicken with pineapple"    =>  4.50,
    "Roasted Duck"              =>  8.00,
    "Mixed Vegetables"          =>  5.00,
    "King Prawns"               =>  3.25
  }


  def display_menu
    puts  "Menu".center(40)
    puts "----------".center(40)
    CHINESE_MENU.each {|key, value| puts "#{key.center(40)}: £#{'%.2f' % value}"}
  end
end
