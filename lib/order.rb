require_relative 'dishes.rb'

class Order
  attr_reader :overview, :total

  def initialize(dishes) # pass in selection of dishes
    @overview = dishes.current_selection
    @total = 0
  end

  def total
    @overview.each { |item| @total += item[:price] * item[:quantity] }
    @total
  end

end
