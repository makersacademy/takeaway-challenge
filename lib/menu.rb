class Menu
  attr_reader :menu

  def initialize
    @menu = { "Mixed Olives" => 3,
              "Bruschetta" => 6,
              "Calamari" => 7,
              "King Prawn Linguine" => 13,
              "Lasagne" => 12 }
  end
  
  def list_of_dishes
    @menu.each do |dish, price|
      puts "#{dish}:  £#{price}"
    end
  end

end
