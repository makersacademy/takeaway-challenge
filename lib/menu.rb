=begin
class Menu

  attr_reader :menu

  def initialize(dish_class = Dish)
    @dish_class = dish_class
    @menu = []
    dish_creator
    @dish = @dish_class.new
  end 

  def fact_checker(food)
    food = food.strip.downcase.to_sym
    MENU.has_key?(food)
  end

=begin
  def dish_creator(food)
    price = @menu.fetch(food.downcase.to_sym)
    @dish = @dish_class.new(food, price)
  end


  def dish_creator
    MENU.each do |name, price|
      @menu << @dish(name, price)
    end 
  end 


  MENU = {
    fries: 2.99,
      burger: 4.99,
      coke: 1.99,
      fanta: 1.49,
      pizza: 10.49,
      lasagna: 5.99,
      sprite: 1.49,
      nachos: 3.49,
      popcorn: 1.49,
  }.freeze

end

=end

