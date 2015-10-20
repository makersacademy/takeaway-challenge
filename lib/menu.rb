class Menu

  attr_reader :dishes

  def initialize
    @dishes = { "chicken katsu" => 3.50,
                "beef udon" => 4.00,
                "crispy fish" => 5.50,
                "miso soup" => 1.50 }
  end

  def menu_pricelist
    puts "Hello! Here is our menu!"
    dishes.each { |dish, price| puts "#{dish}: £#{price}0" }
  end

end
