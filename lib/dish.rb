class Dish

  attr_reader :name, :price, :prep_time

  def initialize(name, price, prep_time)
    @name = name
    @price = price
    @prep_time = prep_time
  end

end