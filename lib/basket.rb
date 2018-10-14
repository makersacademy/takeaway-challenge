class Basket

  attr_reader :basket

  def initialize
    @basket = {}
  end

  def view
    @basket.map do |key, value|
      "#{key}, £#{value}"
    end.join("\n")
  end

  def total
    @basket.values.sum
  end

  def review_order
    "#{view}\nTotal: £#{total}"
  end

end
