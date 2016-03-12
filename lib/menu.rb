class Menu

    LIST = {
            'Risotto'   => 5.5,
            'Carbonara' => 6.5,
            'Bolognese' => 6,
            'Calzone'   => 6,
            'Pizza'     => 7,
            'Coke'      => 2
            }

  def show
    LIST
  end

  def add(item, price)
    LIST[item] = price
  end

  def remove(item)
    LIST.delete(item)
  end

end
