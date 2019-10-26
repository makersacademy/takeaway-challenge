class Menu

  def dishes
    { 
      "DAIFUKU" => 2,
      "ICHIGO"  => 3
    }
  end

  def print_menu
    dishes.map do |mochi, price|
      "#{mochi}, £#{price}"
    end
  end

end
