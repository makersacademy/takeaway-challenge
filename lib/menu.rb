class Menu
  def initialize
    @menu = {}
  end

  def add(dish)
    fail "This dish is already on the menu" if @menu.include?(dish.name)
    @menu[dish.name] = dish.price
  end

  def remove(dish)
    fail "This dish doesn't exist on the menu" unless @menu.include?(dish.name)
    @menu.delete(dish.name)
  end

  def list
    return "Nothing on menu" if @menu.empty?
    return @menu.map {|name, price| "#{name}: £#{price}"}
  end
end