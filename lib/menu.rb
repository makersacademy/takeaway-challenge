class Menu

  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def show
    dishes.map do |dish|
      "#{dish[:name]}: £#{dish[:price]}"
    end.join("\n")
  end
end
