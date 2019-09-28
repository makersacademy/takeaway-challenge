class TakeAway
  attr_reader :menu, :order

  def initialize
    @order = []
    @menu = [
      { name: 'Chicken Poke', price: 7.99 },
      { name: 'Salmon Poke', price: 8.99 },
      { name: 'Duck Dumpling', price: 4.99 },
      { name: 'Prawn Dumpling', price: 5.45 },
      { name: 'Coke', price: 0.95 },
      { name: 'Still Water', price: 0.95 }
            ]
  end

  def read_menu
    @menu.each { |i| puts i[:name] + " £#{i[:price]}" }
  end

  def order_dish(dish, quantity = 1)
    @menu.each { |i|
      if i[:name] == dish
        order = dish, quantity
        @order << order
      end
    }
  end

  # def verify_total(order)
  #
  # end

  # def print_out(item)
  #   item.each { |k, v| puts k + " £ #{v}" }
  # end
end
