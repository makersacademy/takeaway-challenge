class Menu

  def initialize
    @menu = menu
  end

  def menu
    {
      "Tomato Salad" => 12.00,
      "Grilled octopus" => 16.00,
      "Lamb Burger" => 10.00,
      "Beef Burger" => 9.00,
      "Spicy Meatballs" => 12.00,
      "Calamari" => 15.00,
    }
  end

  def print_menu
    @menu.each do |item, price|
      puts "Item: #{item}, cost #{price}£"
    end
  end
  
end
