class Takeaway
  attr_reader :menu, :orders

  def initialize
    @menu = [{ rice: 3 }, { chickhen: 2 }, { beans: 3 }, { yam: 2 },
    { fish: 4 }, { noodles: 2 }]
    @orders = []
  end

  def add_dishes(dish, price)
    @menu << { dish => price }    
  end

  def print_menu
    @menu.each { |dishes| puts dishes }
  end
end
