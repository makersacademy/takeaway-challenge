class Takeaway

  attr_reader :menu, :basket

  def initialize
    @menu = File.read("./lib/menu.txt").split("\n").map { |dish| eval(dish) }
    # Saves menu.txt file as an array of hashes. 
    # Each hash represents a menu item and has keys: :dish and :price.
    @basket = []
  end

  def see_menu 
    # @menu.each { |item| puts "%{dish}: %{price}" % item}
    @menu
  end

  def add_to_order(dish, quantity)
    raise "Dish not on menu" unless menu.any? { |item| item[:dish] == dish }

    @basket << { dish: dish, quantity: quantity, unit_price: calculate_unit_price(dish) }
  end

  def calculate_unit_price(dish)
    unit = menu.select { |item| item[:dish] == dish }
    unit[0][:price]
  end

  def calculate_total
    sum = 0
    basket.each { |dish| sum += (dish[:unit_price] * dish[:quantity]) }
    sum
  end

  def view_order
    [basket, calculate_total]
  end

  def place_order
    require_relative 'send_sms'
  end

end
