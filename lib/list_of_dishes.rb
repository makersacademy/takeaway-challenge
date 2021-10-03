class ListofDishes
  attr_accessor :list_of_dishes, :dish, :price, :total_order
  
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

  def order
    loop do
      print_menu
      order = gets.chomp.capitalize
      self.make_order(order)
      if order == "finish" 
        break
      end
    end
  end

  def make_order(dish)
    if @list_of_dishes.include?(dish) 
      @total_order << @list_of_dishes.assoc(dish) 
    elsif 
      dish == "finish"
      return @total_order
    elsif
      !@list_of_dishes.include?(dish) 
        raise("Dish not found!")
    end
  end

  def print_total_order
    total = concat(make_order.total_order)
  end
end



  


