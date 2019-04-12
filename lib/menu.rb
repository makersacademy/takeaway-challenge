class Menu
  attr_reader :menu_list

  def initialize
    @menu_list = [
      "Mozzarella Sticks",
      "Garlic Bread",
      "Chicken Bites",
      "Margherita Pizza",
      "Pepperoni Pizza",
      "Vegetarian Pizza"
    ]
  end

  def menu_display
    puts " "
    puts "~~~~~~~~~~ MENU ~~~~~~~~~~".center(40)
    puts " "
    menu_sides
    menu_mains
  end

  def menu_sides
    puts "--- Sides ---".center(40)
    puts "Mozzarella Sticks : £3.49".center(40)
    puts "Garlic Bread : £3.99".center(40)
    puts "Chicken Bites : £2.99".center(40)
    puts " "
  end

  def menu_mains
    puts "--- Mains ---".center(40)
    puts "Margherita Pizza : £12.99".center(40)
    puts "Pepperoni Pizza : £16.99".center(40)
    puts "Vegetarian Pizza : £16.99".center(40)
    puts " "
  end
end
