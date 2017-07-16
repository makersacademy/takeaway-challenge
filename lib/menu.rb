class Menu

  attr_reader :dishes

  def initialize
    @dishes = { "Burrito" => 8,
                "Fajitas" => 10,
                "Tacos" => 5 }
  end

  def print_dishes
    print_each_dish
  end

private

  def print_each_dish
    @dishes.each { |name, price| puts "#{name} - £#{price}" }
  end

end
