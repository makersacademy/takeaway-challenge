require_relative './dish.rb'

class Cuisine
  attr_reader :dishes
  def initialize(cuisine, dish_klass)
    @cuisine = cuisine.to_sym
    @dish_klass = dish_klass
    @dishes = []
    @kitchen = {
      chinese: [["chow mein",3.99],["special fried rice",4.50],["sweet and sour chicken",4.25]],
      indian: [["chicken korma",4.75],["poppadom",0.99],["naan bread",2.99]],
      italian: [["pizza",7.00],["spaghetti bolognaise",5.60],["calzone",7.50]]
    }
  end

  def create_dishes
    @kitchen[@cuisine].each do |dish|
      dishes << @dish_klass.new(dish[0],dish[1])
    end
  end
end
