class Menu

  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def print
    dishes.map do |title, price|
      "% £%.2f" % [title.to_s, price]
    end.join(", ")
  end
end
