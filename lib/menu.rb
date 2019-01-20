class Menu
  def initialize(dishes)
    @dishes = dishes
  end

  def print_menu
    @dishes.map { |name, price|
      "#{name} £#{price.to_f}"
    }.join(', ')
  end
end
