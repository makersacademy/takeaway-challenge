class Order

  attr_reader :dishes, :time

  def initialize(array)
    @dishes = array
    @time = Time.now
  end

  def total_price
    @total_price = 0
    dishes.each { |dish| @total_price += dish.price }
    @total_price
  end


end
