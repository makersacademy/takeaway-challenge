# An object storing a list of meal dishes
class Menu
  attr_reader :dishes, :selection
  def initialize
    @dishes = []
    @selection = []
  end

  def add(dish)
    @dishes << dish
  end

  def view
    @dishes.each_with_index { |dish, index|
      puts "#{index + 1}. #{dish.name} - £#{'%.2f' % (dish.price / 100.00)}\n"
    }
  end

  def select(item_no, qty)
    current = @selection.find { |entry| entry[:item] == item_no }
    if current == nil
    hash = { item: item_no, name: @dishes[item_no - 1].name, qty: qty, unit_cost: @dishes[item_no - 1].price, price: qty * @dishes[item_no - 1].price}
    @selection << hash
    else
      current[:qty] += qty
      current[:price] = current[:qty] * current[:unit_cost]
    end
  end
end
