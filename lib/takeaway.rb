class Takeaway

  INVALID_DISH = "Dish not on menu; order ignored"

  def initialize(menu = Menu.new)
    @menu = menu
    setup_basket
  end

  def menu
    @menu.list
  end

  def order(dish, quantity = 1)
    if @menu.has_dish?(dish)
      add_to_basket(dish, quantity)
    else
      puts INVALID_DISH
    end

  end

  def basket
    @basket.select { |_k, v| v.positive? }
  end

  def setup_basket
    @basket = {}
    populate_valid_dishes
  end

  def populate_valid_dishes
    menu.each_key { |dish| @basket[dish] = 0 }
  end

  def add_to_basket(dish, quantity)
    @basket[dish.to_sym] += quantity
  end

  def total
    total = 0
    @prepared_order.each_value { |numbers| total += (numbers[0] * numbers[1]) }
    total
  end

  def checkout
    output = {}
    @basket.each_pair do |dish, quantity|
      output[dish] = [quantity, @menu.list[dish]] if quantity.positive?
    end
    @prepared_order = output
  end

  def print_basket
    checkout unless @prepared_order
    output = ""
    alphabetical_order = @prepared_order.sort_by { |key| key }.to_h
    alphabetical_order.each_pair do |dish, numbers|
      quantity = numbers[0]
      price = numbers[1]
      output << ", " unless output == ""
      output << "#{dish.to_s} x #{quantity} (£#{price * quantity})"
    end
    output << "\nThe total is £#{total}"
  end

end