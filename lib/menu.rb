class Menu
  
  attr_reader :dishes

  MENU = { 
          "dal" => 6.50, 
          "korma" => 3,
          "rice" => 2.50
          }
  attr_reader :dishes

  def initialize(dishes = MENU) 
    @dishes = dishes
  end 

  def display
    puts "Curry House menu"
    @dishes.each do |name, price|
      puts "#{name}: £#{price}" #could create a Dish class and then call"#{dish.name}: £#{dish.price}" 
    end 
  end 

end

p m = Menu.new
p m.dishes