class Basket

  attr_reader :basket

  def initialize
    @basket = {
      "Boiled Rice" => 2
    }
  end

  def view
    @basket.map do |key, value|
      "#{key}, £#{value}"
    end.join("\n")
  end

  def total
    sum = 0
    @basket.map do |key, value|
      sum += value
    end.join("")
  end

  def review_order
    "#{view}.\nTotal: £#{total}"
  end

end
