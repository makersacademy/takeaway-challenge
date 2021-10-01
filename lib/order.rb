class Order

  attr_reader :dishes, :total

  def initialize(dish_class = Dish)
    @dish_class = dish_class
    @dishes = []
    @dish = nil
    @total = 0
    @menu = {
      fries: 2.99,
      burger: 4.99,
      coke: 1.99,
      fanta: 1.49,
      pizza: 10.49,
      lasagne: 5.99,
    }
  end 

  def add_dish(dish) 
    dish.each do |dish| 
      raise "This dish is not on the menu" if fact_checker(dish) == false
      dish = dish_creator(dish)
      accumulator(dish)
      @dishes << dish
    end
  end

  def check_total
    calc = 0
    @dishes.each do |dish| calc += dish.price end
    @total == calc
  end

private 

  def accumulator(dish)
    @total += dish.price
  end

  def fact_checker(food)
    food = food.downcase.to_sym
    @menu.has_key?(food)
  end

  def dish_creator(food)
    price = @menu.fetch(food.downcase.to_sym)
    @dish = @dish_class.new(food, price)
  end

end