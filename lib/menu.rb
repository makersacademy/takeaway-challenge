class Menu

  attr_reader :menu_hash
  def initialize 
    @menu_hash = {}
  end

  def add_to_menu(dish, price)
    @menu_hash.map { |food, _price| fail 'already on menu' if dish.to_sym == food }
    @menu_hash[dish.to_sym] = price
  end

  def delete_from_menu(dish, _price)
    @menu_hash.each do |food, _price|
      if dish.to_sym == food
        @menu_hash.delete(dish.to_sym)
      end
    end    

  end

  def show_menu
    @menu_hash.each_with_index do |(dish, price), index|
      puts "#{index + 1}. #{dish} = £#{price}"
    end    
  end

  def cost_specific_dish(dish)
    @menu_hash.each do |food, price|
      if dish.to_sym == food
        puts "£#{price}"
      end
    end    
  end

  def generate_example_menu
    @menu_hash[:pizza] = 10
    @menu_hash[:burger] = 7
    @menu_hash[:burger_meal] = 14
    @menu_hash[:fries] = 3
    @menu_hash[:korean_bbq] = 9
  end
  

end
