class Order
  # for storing the order details
  attr_reader :total

  def initialize
    @dishes = {}
    @total = 0
  end

  def add_dishes(request)
    request.split(",").each { |m|
      meal = m.split("-")[0].strip.downcase
      number = m.split("-")[1].strip.to_i
      if meal == "total"
        @total = number
      else
        @dishes[meal] = number
      end
    }
    @dishes
  end

  def count
    @dishes.values.inject(:+)
  end

end
