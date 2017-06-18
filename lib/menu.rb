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

  def get(dish_name)
    @dishes.select { |dish| dish[:name] == dish_name }.first
  end
end
