class Menu

  attr_reader :menu

  def initialize
    @menu = {       'California roll' =>    4.0,
                    'Spicy salmon roll' =>  4.0,
                    'Spicy tuna roll' =>    4.5,
                    'Dragon roll' =>        6.0,
                    'Prawn tempura roll' => 5.0,
                    'Vegetarian roll' =>    3.5  }
  end

  def display_menu
    @menu.each do |dish, price|
      puts "#{dish}: £#{price}"
    end
  end

end
