require_relative 'order'

class Total
  attr_reader :meal

  def initialize(meal = Order.new.selection)
    @meal = meal
  end

  def bill
    sum = []
    meal.each do |item|
      sum << item[:price].to_f * item[:quantity]
    end
    sum.inject(:+)
  end
end
