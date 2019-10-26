class Takeaway

  attr_reader :menu, :ordered

  def initialize
    @menu = [
      { dish: 'ceviche', price: 10 }, { dish: 'causa', price: 9 },
      { dish: 'chicharron', price: 11 }, { dish: 'anticucho', price: 12 },
      { dish: 'empanada', price: 6 }, { dish: 'yuca', price: 5 },
      { dish: 'cancha', price: 3 }, { dish: 'helado', price: 5 },
      { dish: 'alfajor', price: 3 }, { dish: 'picarones', price: 7 }
    ]

    @ordered = []
  end

  def show_menu
    @menu
  end

  def order(dish)
    food = menu.select { |comida| comida[:dish] == dish }
    ordered << Hash(*food)
  end

  def place_order
    quantities
    total_price
  end

  def quantities
    ordered.group_by(&:itself).map do |k, v|
      [k, v.count]
    end
  end

  def total_price
    ordered.map { |precio| precio[:price] }.sum
  end

end
