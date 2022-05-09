class Menu

  attr_reader :items

  def initialize
    @items = {
      chicken: 5.0,
      pizza: 6.5,
      burrito: 4.0,
      nachos: 3.5,
      chips: 1.5
    }
  end

  def display_menu
    @items.collect do |k, v|
      "#{k}, £#{v}0"
    end
  end
end

class Order

  attr_reader :basket, :main_order

  def initialize
    @basket = []
  end

  def select(item, quantity)
    @main_order = { item => quantity }
    @basket << main_order
  end

  def total

  end

end
