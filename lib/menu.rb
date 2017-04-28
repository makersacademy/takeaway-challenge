require_relative './dish.rb'
require_relative './order.rb'

class Menu  

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  # def import_csv(filename) #./dishes.csv -- does not work
  #   CSV.foreach(filename)do |row|
  #   @dishes << Dish.new(row[0], row[1])
  #   end
  # end

  def add_dish(dish)
    @dishes << {:dish_name => dish.name, :price => dish.price} 
  end  

  def list_dishes
    @dishes.each do |dish|
      puts "Dish: #{dish[:dish_name]} - Price: £#{dish[:price]}"
    end
  end

private

  attr_writer :dishes

end
