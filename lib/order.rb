class Order
  attr_reader :dishes

  def initialize(menu)
    @dishes = []
    @current_menu = menu
  end

  def select(dish)
    raise "Dish not on menu." unless @current_menu.dishes.include?(dish)
    @dishes << dish
  end

  def view
    current_order = []
    @dishes.each_with_index do |dish, idx|
      current_order << "\n" if idx != 0
      current_order << format(dish)
    end

    current_order = current_order.join
    current_order += "\n--------------------\n\n"
    current_order += "Current total = #{price(total)}"

  end

  def total
    @dishes.map(&:price).sum
  end

  private

  def format(dish)
     "#{dish.name}: #{price(dish.price)}"
  end

  def price(number)
    sprintf("£%2.2f", number)
  end

end
