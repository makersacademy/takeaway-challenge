class Menu

  attr_reader :dish

  def initialize
    @dish = { curry: 8.95, rice: 3.50, naan:  2.50}

  end

  def print_menu
    puts dish.map { |item, price| "#{item}".capitalize + " - #{price}"}
    
  end
end
