class List

  def initialize
    @list = []
  end

  attr_reader :list

  def add_dish(dish)
    @list << dish
  end

  def view
    @menu = []
    @list.each do |dish|
      name = dish.name
      price = dish.price
      @menu << { name: name, price: price }
    end
    @menu
  end
end
