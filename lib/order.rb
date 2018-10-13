# The Order class is a sub class of customer
# it holds the dishes they choose to buy

class Order

  DEFAULT_TOTAL = 0 # Base cost of order

  attr_accessor :order, :soter

  def initialize
    @order = []   # Initial array to recieve dishes
    @soter  = []  # Holds refinned array of dishes and quantities
    @basket = []  # Holds the string statements for checking
    @total = DEFAULT_TOTAL    # Base cost of the order
  end

  def print_list
    load_sorter # reduces redundant Dish classes in order and + thier quantity
    load_basket # converst the sorter from classes to a string statement
    @basket
  end

  def total
    add_total # Adds all of the prices to the total
    @total
  end

  # Allows the customer class to check if a dish was successfully loaded
  # Must be public because it is called in customer class
  def added?
    @order.empty? ? false : true
  end

  private

  # Sorts the order array and removes copies of dishes
  # Adds one to the dish quantity when a match is found
  def load_sorter
    @order.each do |dish|
      @soter << dish if dish?(dish) == false
      dish.up_quantity if dish?(dish) && dish.is_a?(Dish)
    end
  end

  # converts the array of classes into an array of strings
  def load_basket
    @soter.each do |dish|
      if dish.is_a?(Dish)
        n = dish.name
        q = dish.quantity
        price = dish.price
        @basket << "#{n} x#{q} $#{q * price}"
      end
    end
  end

  # adds the total of order
  def add_total
    @order.each do |dish|
      @total += dish.price
    end
  end

  # checks if the array has the dish
  def dish?(dish)
    @soter.include?(dish)
  end
end
