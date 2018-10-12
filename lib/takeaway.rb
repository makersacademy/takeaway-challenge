class Takeaway
  attr_reader :basket

  def initialize(menu_class, text_class)
    @menu_class = menu_class
    @text_class = text_class
    @menu = nil
    @basket = []
  end

  def list_dishes
    menu.list_dishes
  end

  def add_dish(name, quantity)
    @basket << { name: find_name(name.downcase),
                 quantity: quantity,
                 cost: find_cost(name.downcase, quantity)
    }
  end

  private

  def menu
    @menu ||= @menu_class.new
  end

  def find_name(name)
    menu.dishes.each do |dish|
      dish.each do |dish_name, _price|
        return dish_name if dish_name.downcase == name
      end
    end
    raise "Cannot find the specified dish!"
  end

  def find_cost(name, quantity)
    menu.dishes.each do |dish|
      dish.each do |dish_name, price|
        return price * quantity.to_f if dish_name.downcase == name
      end
    end
  end
end
