require_relative 'price.rb'
class Dish
  attr_reader :name, :price
  attr_accessor :available
  def initialize(name, price, available: true)
    @name = name.to_sym
    @price = price
    @available = available
  end
end
