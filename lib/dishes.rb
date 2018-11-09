class Dishes

    attr_reader :dishes

  def initialize

    @dishes = {"curry" => 5, "rice" => 2.50,
     "spare ribs" => 4.50}

  end

  def list_prices
    return @dishes
  end
end
