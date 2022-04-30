class Takeaway

  def initialize

    @menu = { "Apple Pie" => 4.5,
      "Banana Pie" => 4.5,
      "Tiramisu" => 5}

  end

  def print_menu

    @menu.each do |name, price|
      puts "#{name}: #{price}"
    end

  end

end
