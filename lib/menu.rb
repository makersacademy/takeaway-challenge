class Menu

  attr_reader :menu_hash
  def initialize 
    @menu_hash = {}
  end



  def add_to_menu(dish, price)
    @menu_hash[dish.to_sym] = price
  end

  def delete_from_menu(dish, price)
    @menu_hash.each{ |dish, price|
      delete(dish) && delete(price)}
      turn_keys_to_symbols
  end

  def display_whole_menu
    @menu_hash.each_with_index{|dish, price, index|
    puts "#{index + 1}. #{dish} = £#{price}"}
  end


  def cost_specific_dish(dish)
    @menu_hash.each{ |food, price|
      if dish(&to_sym) == food
        puts "£#{price}"
      end}

  def generate_example_menu
    @menu_hash[:pizza] = 10
    @menu_hash[:burger] = 7
    @menu_hash[:burger_meal] = 14
    @menu_hash[:fries] = 3
    @menu_hash[:korean_bbq] = 9
  end
  

private

def turn_keys_to_symbols
  @menu_hash.transform_keys(&:to_sym)
end

def display_total
end









end