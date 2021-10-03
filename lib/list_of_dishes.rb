class ListofDishes
  attr_accessor :list_of_dishes, :dish, :price
  
  def initialize(hash = self.menu)
    @dish = @list_of_dishes[:dish]
    @price = @list_of_dishes[:price]
    @list_of_dishes = hash
    @total_order = [] 
  end

  def menu
    @list_of_dishes = { "Lassagna" => 9, "Ravioli" => 9, "Spaghetti Bolonese" => 9, "Macarones" => 9, "Penne" => 8, "Canneloni" => 8, "Margherita" => 9, "Four Cheeses" => 10, "Tuna & Onion" => 8, "Veggie Lover" => 9, "Salami" => 10, "Chicken with Tomato" => 10 } 
  end

  def print_menu
    @list_of_dishes.each_with_index do |(dish, price),index|   
      puts "#{index + 1} #{dish} : £#{price}"
    end
    p  "** Select dish or type finish **"
  end
end



  


