class Menu
  MENU = {
    'prawn cracker' => 2,
    'spring roll' => 3,
    'black bean chicken' => 7,
    'stir-fried beef' => 8,
    'crispy pork belly' => 9,
    'chicken chow mein' => 6.5,
    'boiled rice' => 1.5,
    'egg fried rice' => 3.5
  }

  attr_reader :menu

  def initialize(menu = MENU)
    @menu = menu
  end

  def display
    @menu.each_with_index do |(name, price), index|
      puts "#{index + 1}. #{name}....£#{price}"
    end
  end
end
