class Basket
  attr_reader :items

  def initialize(menu)
    @menu = menu
    @items = []
  end

  def add_dish(name, quantity)
    @items << { name: find_name(name),
                quantity: quantity,
                cost: find_cost(name, quantity)
    }
  end

  def total
    @items.map { |item| item[:cost] }.sum
  end

  private

  def find_name(name)
    @menu.dishes.each { |dish| return name if dish.has_key?(name) }
    raise "Cannot find the specified dish!"
  end

  def find_cost(name, quantity)
    @menu.dishes.each do |dish|
      dish.each do |_name, price|
        return price.to_f * quantity if dish.has_key?(name)
      end
    end
  end
end
