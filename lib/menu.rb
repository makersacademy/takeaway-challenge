class Menu
  def initialize(dishes)
    @dishes = dishes
  end

  def view
    formatted_list = @dishes.map do |dish|
      "#{dish.name}: £%.2f" % dish.price
    end
  end
end
