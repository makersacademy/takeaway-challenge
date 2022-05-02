class Menu

  attr_reader :dishes

  def initialize

    @dishes = { "Apple Pie" => 4.5,
      "Banana Pie" => 4.5,
      "Tiramisu" => 5,
      "Carrot Cake" => 4,
      "Brownie" => 4 }

  end

  def print_menu

    @dishes.each do |name, price|
      puts "#{name}: #{price}"
    end

  end

  def in_menu?(dish)

    !!@dishes[dish]

  end

end
