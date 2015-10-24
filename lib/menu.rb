class Menu

  attr_reader :menu, :dish_name, :basket, :quantity

  def initialize
    @menu = {fish_burger: 2.0,
            beef_burger: 4.0,
            chicken_burger: 4.0,
            vege_burger: 2.5}
    @basket = {}
  end

  def read_menu
    @menu
  end

  def add_order(name, quantity)
    @basket[name] = quantity
    basket.each {|key, value| puts "you have added #{key} times #{value} in your basket" }
    @basket
  end

end
