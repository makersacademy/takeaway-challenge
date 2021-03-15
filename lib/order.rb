class Order

  attr_reader :dishes, :delivery_time

  def initialize
    @dishes = []
    @delivery_time = nil
  end

  def complete
    time = Time.new
    @delivery_time = "#{time.hour + 1}:#{time.min}"
  end

  def verify_total
    sum = 0
    @dishes.each { |dish| sum += dish.price }
    sum
  end

end
