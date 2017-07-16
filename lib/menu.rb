class Menu

  attr_reader :dishes, :list_dishes

  def initialize
    @dishes = { "Burrito" => 8,
                "Fajitas" => 10,
                "Tacos" => 5 }
  end

  def read_menu
    print_each_dish
  end

private

  def print_each_dish
    @dishes.each { |name,price| puts "#{name} - £#{price}" }
  end

end
