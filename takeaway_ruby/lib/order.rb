class Order

  attr_reader :dishes, :total, :calc, :menu

  def initialize(dish_class = Dish)
    @dish_class = dish_class
    @dishes = []
    @dish = nil
    @total = 0
    @menu = MENU
  end 

  def add_dish(item, quantity = 1) 
    
    quantity.times do
      @dish = dish_creator(item)
      accumulator(@dish)
      @dishes << @dish
      @dish = nil
    end
  end

  def menu_listing
    puts "Menu listed below:" 
    listing = MENU.collect { |key, value| "#{key}: £#{value}" }
    listing.each { |item| puts item } 
  end

private 

  def accumulator(dish)
    @total += dish.price
  end

  def fact_checker(food)
    food = food.strip.downcase.to_sym
    @menu.has_key?(food)
  end

  def dish_creator(food)
    raise "This dish is not on the menu" if fact_checker(food) == false
    price = @menu.fetch(food.downcase.to_sym)
    @dish = @dish_class.new(food, price)
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
