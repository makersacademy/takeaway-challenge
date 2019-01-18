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
  # TODO: Finish refactoring me -> move to hash of hashes

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
    @prepared_order.each_value { |numbers| total += (numbers[0] * numbers[1]) }
    total
  end

  # TODO WOrk out a proper data structure
  # Hash of hashes? {Dish:  {Quantity: x, Price: y}     }

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
      output << "#{dish} x #{quantity} (£#{price * quantity})"
    end
    output << "\nThe total is £#{total}"
  end

end