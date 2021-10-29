# require_relative './dish.rb'
require 'csv'

class Order
  attr_reader :available_dishes

  def initialize
    @available_dishes = []
  end

  def load_dishes
    #@available_dishes = []
    # file = File.open(filename, "r")
     CSV.foreach("available_dishes.csv") do |line|
       dish, price = line
       @available_dishes << { dish: dish, price: price.to_f }
     end
    return true
  end
end



