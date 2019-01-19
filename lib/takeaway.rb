require_relative 'menu'

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
    @basket.select { |_dish, numbers| numbers[:price].positive? }
  end

  def setup_basket
    @basket = {}
    populate_valid_dishes
  end

  def populate_valid_dishes
    menu.each_pair { |dish, price| @basket[dish] = { quantity: 0, price: price } }
  end

  def add_to_basket(dish, quantity)
    @basket[dish.to_sym][:quantity] += quantity
  end

  def total
    total = 0
    @prepared_order.each_value do |hash|
      total += (hash[:price] * hash[:quantity])
    end
    total
  end

  # TODO DRY the code with knowledge of the hash structure

  def prepare_order
    output = {}
    @basket.each_pair do |dish, hash|
      output[dish] = hash if hash[:quantity].positive?
    end
    @prepared_order = output
  end

  def checkout(customer_total)
    prepare_order
    raise 'Halting Order: Unexpected Total' if total != customer_total
  end

  def print_basket
    prepare_order
    output = ""
    alphabetical_order = @prepared_order.sort_by { |key| key }.to_h
    alphabetical_order.each_pair do |dish, hash|
      output << ", " unless output == ""
      output << "#{dish} x #{hash[:quantity]} (£#{hash[:price] * hash[:quantity]})"
    end
    output << "\nThe total is £#{total}"
  end

end