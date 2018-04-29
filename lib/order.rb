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

  def list
    check_empty_order

    @items.each do |item|
      puts "#{item[:amount]} x #{item[:dish].name}"
    end
  end

  def total
    check_empty_order

    @items.map { |item| item[:amount] * item[:dish].price }.reduce(:+)
  end

  def confirm
    check_empty_order
  end

  private

  def on_menu?(dish)
    @menu.dishes.include?(dish)
  end

  def add_existing_dish(dish, amount)
    @items.each do |item|
      item[:amount] += amount if same?(item, dish)
    end
  end

  def add_new_item(dish, amount)
    @items.push({ dish: dish, amount: amount })
  end

  def dish_on_order?(dish)
    @items.any? { |item| same?(item, dish) }
  end

  def same?(item, dish)
    item[:dish] == dish
  end

  def empty_order?
    @items.empty?
  end

  def check_empty_order
    raise 'The order is empty' if empty_order?
  end
end
