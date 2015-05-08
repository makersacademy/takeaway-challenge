require_relative 'dish'

class DishList
  attr_reader :list
  def initialize
    @list = [Dish.new('A1', 'Merry Paradise', 580),
             Dish.new('A2', 'Wandering Dragon', 600),
             Dish.new('A3', 'Four Seasons', 600),
             Dish.new('A4', 'Happy Family Meal', 650),
             Dish.new('A5', 'Cheeky Chappy', 700),
             Dish.new('B1', 'Foo Yung', 380),
             Dish.new('B2', 'Chop Suey', 395),
             Dish.new('B3', 'Won Ton', 350),
             Dish.new('B4', 'House Special Satay', 450)]
  end

  def lookup item_code
    list.each { |dish| return dish if dish.order_code == item_code }
    fail 'No dish found with that order code'
  end
end