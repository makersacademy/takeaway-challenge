class Takeaway
attr_reader :menu, :name, :price

  def initialize
    @menu = []
  end

  def show_menu
    @menu
  end

  def add_dish(name, price)
    dish = Hash.new
    dish[:name] = name
    dish[:price] = price
    @menu << dish
  end

end
