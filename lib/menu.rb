class Menu

  def initialize
    @menu =   { "4x chicken wings" => 1.59,
        "chicken burger meal" => 4.49,
        "fries" => 1.29 }
  end

  def display_menu
    @menu.each do |dish, price|
      puts "#{dish}, £#{price}"
    end
  end
end
