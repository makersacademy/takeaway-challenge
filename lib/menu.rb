class Menu

  attr_reader :dishes

  def initialize
    @dishes = {
       "Olives" => 2.5,
       "Bruschetta" => 5,
       "Pizza" => 10,
       "Pasta" => 12,
       "Risotto" => 18,
       "Burger" => 13,
       "Steak" => 20,
       "Sole" => 23,
       "Tiramisu" => 7.5,
       "Panna cotta" => 6.5
    }
  end

  def meals
    @dishes.clone
  end

  def list_dishes
    @dishes.each { |dish, price| puts "#{dish} £#{price}" }
  end

  def check_availability(dish)
    raise "Dish not available. Please make a new selection." if @dishes[dish].nil?
  end
end
