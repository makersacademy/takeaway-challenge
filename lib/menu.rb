class Menu

  attr_reader :dishes

  def initialize
    @dishes = {
      "Olives" => 2.5,
      "Pizza" => 10,
      "Pasta" => 12,
      "Risotto" => 18,
      "Burger" => 13,
      "Steak" => 20,
      "Tiramisu" => 7.5,
      "Panna cotta" => 6.5
    }
  end

  def view_dishes
    @dishes.each { |item, price| puts "#{item} £#{price}" }
  end

  def check_availability(item)
    msg = "Dish not available. Please make a new selection."
    raise msg if @dishes[item].nil?
  end
end
