class Menu

  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def show
    dishes.map { |k, v| "%s £%.2f" % [k.to_s, v] }.join(", ")
  end

end