class Menu
  def initialize(items = [])
    @items = items
  end

  def items
    return @items
  end

  def add_item(name, price)
    @items << new_food(name, price)
  end

  def find_item(item)
    @items.each do |x|
      if x.name == item
        return x
      end
    end
  end

  def show_dishes
    @items.each do |food|
      puts "#{food.name} costs £#{food.price}"
    end
  end

  private

  def new_food(name, price)
    return Food.new(name, price)
  end
end
