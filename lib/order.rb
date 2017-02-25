class Order

  def initialize
    @choosen_dishes = []
  end

  def add(dish_quantity)
    choosen_dishes << dish_quantity
    # @choosen_dishes << {name: dish[:name],price: dish[:price], quantity: quantity}
  end

  def calculate_total
    choosen_dishes.map{|info| info[:price]*info[:quantity]}.reduce(:+)
  end

  def details
    choosen_dishes.dup
  end

  private
  attr_reader :choosen_dishes
end
