class Option
  attr_reader :dishes, :meal

  def initialize(dishes)
    @meal = []
    @dishes = dishes
  end

  def add_option(selection, amount)
    @dishes.dishes.each do |m|
      amount.times {@dishes << m if m[:item] == selection}
    end
  end

  def total_options
    @dishes.map { |m| m[:item_price] }.inject(:+)
  end
 end
