class Menu

  DISHES = {
    "Pepperoni Passion Pizza" => 6.75,
    "Mighty Meaty Pizza" => 7.25,
    "Chips n' Cheese" => 3.00,
    "10 Hot Wings" => 4.00,
    "Deep-fried Mars bar" => 2.50
  }.freeze

  def contain?(dish)
    DISHES.key?(dish)
  end

  def list
    Menu::DISHES.each { |key, value| puts "#{key}: £#{'%.2f' % value}" }
  end

end
