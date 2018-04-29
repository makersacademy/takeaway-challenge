class Order
  attr_reader :items

  def initialize(menu)
    @menu = menu
    @items = []
  end

  def add(dish, amount = 1)
    raise 'Not on menu' unless on_menu?(dish)

    return add_existing_dish(dish, amount) if dish_on_order?(dish)
    add_new_item(dish, amount)
  end

  private

  def on_menu?(dish)
    @menu.dishes.include?(dish)
  end

  def add_existing_dish(dish, amount)
    @items.each do |item|
      item[:amount] += amount if item[:dish] == dish
    end
  end

  def add_new_item(dish, amount)
    @items.push({ dish: dish, amount: amount })
  end

  def dish_on_order?(dish)
    @items.any? { |item| item[:dish] == dish }
  end
end
