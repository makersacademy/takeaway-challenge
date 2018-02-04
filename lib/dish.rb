class Dish

  FOOD_MENU = {
    1 => ["Beef burger", 10],
    2 => ["Cheese burger", 12],
    3 => ["Chicken burger", 9],
    4 => ["Fries", 4],
    5 => ["Strawberry shake", 5],
    6 => ["Banana shake", 5],
    7 => ["Oreo shake", 5]
  }

  attr_reader :number, :name, :price
  attr_accessor :quantity

  def initialize(dish_number, quantity = 1)
    @number = dish_number
    @name = FOOD_MENU[dish_number][0]
    @price = FOOD_MENU[dish_number][1]
    @quantity = quantity
  end

  def add_quantity(quantity)
    self.quantity += quantity
  end

  def info
    "Dish number: #{number}. Dish name: #{name}. Price: £#{price}."
  end

  def full_info
    info + " Quantity: #{quantity}"
  end

end
