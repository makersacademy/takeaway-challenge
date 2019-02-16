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

  def correct?
  end

  def total
  end

  def send_txt
  end

end

# ceviche => 10, causa => 9, chicharron => 11, anticucho => 12, empanada => 6,
# yuca => 5, cancha => 3, helado => 5, alfajor => 3, picarones => 7
