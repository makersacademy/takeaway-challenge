class Menu

  MENU = {  'California roll' =>    4.0,
            'Spicy salmon roll' =>  4.0,
            'Spicy tuna roll' =>    4.5,
            'Dragon roll' =>        6.0,
            'Prawn tempura roll' => 5.0,
            'Vegetarian roll' =>    3.5  }

  attr_reader :menu

  def initialize
    @menu = MENU
  end

  def display_menu
    menu.each do |dish, price|
      puts "#{dish}: £#{price}"
    end
  end


end


# restaurant_menu = { "Ramen" => 3, "Dal Makhani" => 4, "Coffee" => 2 }
# restaurant_menu.each do | item, price |
#   puts "#{item}: $#{price}"
# end
