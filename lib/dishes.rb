class Dishes

    attr_reader :dishes

  def initialize

    @dishes = { "curry" => 5.00.to_f, "rice" => 2.50.to_f,
     "spare ribs" => 4.50.to_f }

  end

  def list_prices
    return @dishes
  end
end
