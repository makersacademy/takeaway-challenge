# Menu functionality: stores menu, prints menu & checks if item on menu

require_relative "takeaway"
require_relative "order"

class Menu

  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  # Initializes new instance of Menu class, taking one parameter, a hash of
  # dishes and prices, which will be the menu, e.g. in the format {pizza: 9.99,
  # burger: 2.99, chips: 1.99}.
  end

  def print
    dishes.map { |title, price|
      "%s £%.2f" % [title.to_s.capitalize, price]
    }.join(", ")
    #
    # Executes block for each key-value pair in dishes hash.  The block formats
    # the key-value pair info into a string that is more easily read by a human.
    #
    # For example: {pizza: 9.99} => "Pizza £9.99"
    #
    # The string template denoted by "" on th left of the % symbol defines how
    # we want to format the hash info into a string.  The info in [] on the
    # right of the % assigns these values to each of the % INSIDE the template
    # string as follows:
    #
    # => "%s" interpolates the key (i.e. the dish title), which has been
    #     converted to a string and capitalized by "title.to_s.capitalize".
    #
    # = > "£%.2f" interpolates the value (i.e. the price) and formats into £
    #     with two decimal places.
    #
  end

  def has_dish?(dish)
    !!dishes[dish]
    # Looks up dishes hash using whatever argument is passed in for the dish
    # parameter as the hash key.  If that hash key is not present it will return
    # false and vice versa.
  end

  def price(dish)
    dishes[dish]
   # Looks up the price of a dish in the dishes hash using the dish title as the
   # key, where the price is the corresponding value.
  end

end
