class Menu

  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

def initialize
  @dishes = {"patties" => 2.95,
            "ackee" => 6.95}

  # def print
  #   dishes.map do |title, price|
  #     # .map applies function to ever item of iterable and returns a list of results.
  #     "%s £%.2f" % [title.to_s.capitalize, price]
  #   end.join(", ")


  end
end
