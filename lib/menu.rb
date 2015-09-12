class Menu

  attr_writer :menu

  def initialize
    @menu =   { "crispy chilli beef" => 5.99,
        "sweet and sour chicken" => 4.99,
        "egg fried rice" => 2.99
      }
  end

  def display_menu
    @menu.each do |dish, price|
      puts "#{dish}, £#{price}"
      puts @menu
    end
  end

end
