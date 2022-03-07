# require_relative 'dish.rb'

class Menu

  attr_reader :dishes

  def initialize 
    # @dishes = []
    @dishes = {'burger' => 5, 'salad' => 4, 'pasta' => 7, 'wrap' => 3}
  end

  # def add_dish(name, price)
  #   @dishes << Dish.new(name, price)
  # end

  def list_dishes
    @dishes.each { |dish, price| puts "#{dish} £#{price}"}
  end
end
