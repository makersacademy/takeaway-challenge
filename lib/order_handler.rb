require_relative 'menu'

# Takes a menu or initializes a new one.
# Sends output for Interface to display.
# Instantiates a Reassurer with a time message.
class OrderHandler
  def initialize(menu = Menu.new)
    @menu = menu
    @selected_dishes = {}
  end

  # Returns an array of arrays. In each subarray
  # the first element is a string naming the dish
  # and the second an integer - the price.
  def see_list
    output = []
    menu.items.each { |key, value| output << [key, value] }
    output
  end

  # Accepts a dish name as a string and an
  # integer which is the quantity and stores
  # these in the instance variable
  # @selected_dishes which is a hash
  def select_dish(dish, quantity = 1)
    @selected_dishes[dish] = quantity
  end

  # Returns an array of arrays containing a string
  # naming the dish, the quantity, the total price
  # for that quantity
  def order
    output = []
    selected_dishes.each { |dish, quantity| output << [dish, quantity] }
    output.each { |line| line << price(line[0], line[1]) }
    output
  end

  private

  attr_reader :menu, :selected_dishes

  # Takes a dish and its quantity and returns the
  # total price for that quantity
  def price(dish, quantity)
    menu.items[dish] * quantity
  end
end
