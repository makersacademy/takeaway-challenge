class Takeaway

  attr_reader :menu

  def initialize
    @menu = File.read("./lib/menu.txt").split("\n").map { |dish| eval(dish) }
    # Saves menu.txt file as an array of hashes. 
    # Each hash represents a menu item and has keys: :dish and :price.
  end

  def see_menu 
    #@menu.each { |item| puts "%{dish}: %{price}" % item}
    @menu
  end

end
