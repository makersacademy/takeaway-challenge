class Menu

attr_reader :dishes

  def initialize
    @dishes = {
      'Classic Fondue' => 13.0,
      'Special Fondue' => 14.5,
      'French Raclette' => 10.0,
      'Swiss Raclette' => 11.0,
      'Mulled Wine' => 3.5
      }
  end

  def show
    dishes.each {|dish, price| puts "#{dish} : £#{price.to_f}" }
  end

  def available?(dish)
    dishes.key?(dish)
  end

  def price(dish)
    dishes[dish]
  end

end
