class Menu

  def food_items
    {"Pizza" => 10, "Burger" => 5, "Chips" => 2, "Coffee" => 3, "Coke" => 2}
  end

  def view
    food_items.each do |item, price|
      puts "#{item} - £#{price}"
    end
  end
end
