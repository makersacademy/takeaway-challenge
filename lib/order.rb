require_relative 'menu'

class Order

  DELIVERY_TIME = 1800 # seconds

  attr_reader :menu, :cost, :items

  def initialize(menu = Menu.new)
    @menu = menu.list
    @items = Hash.new
    @cost = 0
  end

  def update(items)
    manage_order(items)
    calculate_cost
  end

  def confirm
    "Thank you! Your order was placed and will be delivered before #{Time.new + DELIVERY_TIME}."
  end

  private

  def manage_order(items)
    items = items.split(", ")
    items.each { |dish|
      reformat_order(dish)
    }
  end

  def reformat_order(dish)
    dishes = dish.split(" ")
    dish = dishes[1].to_sym
    number = dishes[0].to_i
    check_order(dish, number)
    store_order(dish, number)
  end

  def check_order(dish, number)
    fail "#{dish} is not on the menu" unless @menu.include?(dish)
  end

  def store_order(dish, number)
    @items[dish] = number
  end

  def calculate_cost
    @cost = 0
    @items.each { |meal, number|
      item_cost = @menu[meal].split("£")[1].to_i
      @cost += (item_cost * number)
    }
  end

end
