class Menu

  def initialize
    @menu = {
      Biltong: 5,
      Droewors: 6,
      Fritos: 2,
      Fizzer: 1,
      Chops: 9,
      Boerewors: 7,
      Bobotie: 8
    }
  end

  def menu
    @menu.each do |food, price|
      puts "#{food} is £#{price}"
    end
  end

  def on_menu?(food)
    !@menu[food.to_sym].nil?
  end

  def cost(food)
    @menu[food.to_sym]
  end

end
