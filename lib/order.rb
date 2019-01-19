class Order

  INVALID_DISH = "Dish not on menu; order ignored"

  def initialize(menu)
    @menu = menu
    @basket = {}
    populate_valid_dishes
  end

  def take(dish, quantity = 1)
    if @menu.has_dish?(dish)
      hash = @basket[dish.to_sym]
      hash[:quantity] += quantity
    else
      puts INVALID_DISH
    end
  end

  def basket
    @basket.select { |_dish, numbers| numbers[:quantity].positive? }
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



  def prepare_order
    output = {}
    @basket.each_pair do |dish, hash|
      output[dish] = hash if hash[:quantity].positive?
    end
    @prepared_order = output
  end

  def calculate_total
    total = 0
    @prepared_order.each_value do |hash|
      total += (hash[:price] * hash[:quantity])
    end
    total
  end


end