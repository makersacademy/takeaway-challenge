class Order

  attr_reader :dishes

  def initialize(array)
    @dishes = array
  end

  def total_price
    @total_price = 0
    dishes.each { |dish| @total_price += dish.price }
    @total_price
  end


end
