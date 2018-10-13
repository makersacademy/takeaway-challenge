class Basket
  attr_reader :items

  def initialize(menu)
    @menu = menu
    @items = []
  end

  def add_dish(name, quantity)
    @items << { name: find_name(name.downcase),
                 quantity: quantity,
                 cost: find_cost(name.downcase, quantity)
    }
  end

  private

  def find_name(name)
    @menu.dishes.each do |dish|
      dish.each do |dish_name, _price|
        return dish_name if dish_name.downcase == name
      end
    end
    raise "Cannot find the specified dish!"
  end

  def find_cost(name, quantity)
    @menu.dishes.each do |dish|
      dish.each do |dish_name, price|
        return price * quantity.to_f if dish_name.downcase == name
      end
    end
  end

  def total
    @items.map { |item| item[:cost] }.sum
  end
end
