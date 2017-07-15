class Order
  def initialize(menu)
    @menu = menu
    @basket = Hash.new(0)
  end

  def read_menu
    @menu.to_s
  end

  def basket
    @basket.dup
  end

  def add(dish_name, quantity)
    if @menu.dishes[dish_name].nil?
      puts "#{dish_name} cannot be added to the basket as it is not on the menu"
      return 0
    end
    @basket[dish_name] += quantity
  end
end
