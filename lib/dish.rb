class Dish
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

=begin
  def self.price
    return if @price.is_a? Numeric
    
    raise "Can only price dish using numbers"
  end
=end


end