class Menu

  def initialize(dish_klass: Dish)
    @dish_class = dish_klass
    @list = []
  end

  def add_dish(name,price)
    @list << create_dish(name,price)
  end

  def list
    @list.dup
  end

  def display
    display = {}
    @list.each { |dish| display[dish.name] = dish.price }
    display
  end

  private

  def create_dish(name,price)
    @dish_class.new(name,price)
  end
end
