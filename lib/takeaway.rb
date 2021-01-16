class Takeaway

  attr_reader :menu, :basket

  def initialize
    @menu = File.read("./lib/menu.txt").split("\n").map { |dish| eval(dish) }
    # Saves menu.txt file as an array of hashes. 
    # Each hash represents a menu item and has keys: :dish and :price.
    @basket = []
  end

  def see_menu 
    #@menu.each { |item| puts "%{dish}: %{price}" % item}
    @menu
  end

  def add_to_order(dish, quantity)
    raise "Dish not on menu" if !menu.any? { |item| item[:dish] == dish }
    @basket << {dish: dish, quantity: quantity}
  end

end
