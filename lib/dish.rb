require 'csv'
require_relative './menu.rb'

@dishes =[]

class Dish 
  
  attr_reader :name, :price 
  
  def initialize(name, price)
    @name = name
    @price = price
  end

  # def import_csv(filename) #./dishes.csv
  # CSV.foreach("filename")do |row|
  #   @dishes << Dish.new(row[0], row[1])
  #   end
  # end

end


