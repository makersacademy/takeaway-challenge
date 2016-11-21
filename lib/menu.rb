class Menu

  attr_reader :dishes

  def initialize
    @dishes = {
      "pepperoni" => 10,
      "vegetable" => 8,
      "margherita" => 8,
      "garlic bread" => 3,
      "chips" => 3,
      "coca-cola" => 2
    }
  end

  def print_menu
    line_width = 30
    self.dishes.each do |item, price|
      puts "#{item}".ljust(line_width / 2) + "£#{price.to_s}".rjust(line_width / 2)
    end
  end

  def has_item?(item)
    dishes.has_key?(item)
  end

end
