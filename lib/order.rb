class Order

  INVALID_DISH = "Dish not on menu; order ignored"

  def initialize(menu)
    @menu = menu
    @basket = {}
    populate_valid_dishes
  end

  def take(dish, quantity = 1)
    @basket[dish.to_sym][:quantity] += quantity if @menu.has_dish?(dish)
    puts INVALID_DISH unless @menu.has_dish?(dish)
  end

  def basket
    @basket.select { |_dish, numbers| numbers[:quantity].positive? }.sort.to_h

  end

  def total
    calculate_total
  end

  private

  def show_menu
    @menu.list
  end

  def populate_valid_dishes
    show_menu.each_pair do |dish, price|
    @basket[dish] = { quantity: 0, price: price }
    end
  end

  def calculate_total
    total = 0
    @basket.each_value do |hash|
      total += (hash[:price] * hash[:quantity])
    end
    total
  end


end