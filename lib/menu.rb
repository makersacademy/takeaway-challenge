class Menu
  attr_reader :dishes

  def initialize(*dishes)
    @dishes = dishes
  end

  def new_dish(dish)
    @dishes << dish
  end

  def list
    @list = []
    @dishes.each do |dish|
      @list << "#{dish.name} - £#{'%.2f' % dish.price}"
    end
    @list.join(", ")
  end
end
