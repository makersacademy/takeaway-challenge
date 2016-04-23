class Menu
  def initialize(*dishes)
    @dishes = dishes
  end

  def dishes
    @dishes.dup
  end

  def new_dish(dish)
    @dishes << dish
  end

  def list
    @list = []
    @dishes.each do |dish|
      @list << "#{dish.name} - £#{format('%.2f',dish.price)}"
    end
    @list.join(", ")
  end
end
