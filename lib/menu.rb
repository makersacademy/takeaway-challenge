class Menu
  
  attr_reader :dishes

  MENU = { 
          "dal" => 6.50, 
          "korma" => 3.00,
          "rice" => 2.50
          }
  attr_accessor :dishes

  def initialize(dishes = MENU) 
    @dishes = dishes
  end 

  def add_dish(name, price) # should I ideally be using dependency injection to inject an instance of Dish class? Not sure how to do this because Dish has required arguments name and price... 
    @dishes[name] = price
  end  

  def display
  puts "Curry House Menu"
    @dishes.each do |name, price|
    puts "#{name}: £#{'%.2f' % price}" 
    end
  end
end