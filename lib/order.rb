class Order
  def initialize(menu)
    @menu = menu
    @basket = Hash.new(0)
    @total = 0
  end

  def read_menu
    @menu.to_s
  end

  def basket
    @basket.dup
  end

  def total
    @total = 0
    @basket.each do |dish_name, quantity|
      dish_price = @menu.dishes[dish_name]
      @total += dish_price * quantity
    end
    @total
  end

  def add(dish_name, quantity = 1)
    return "#{dish_name} is not on the menu" if @menu.dishes[dish_name].nil?
    @basket[dish_name] += quantity
    "#{quantity}x #{dish_name} added to your basket"
  end
end
