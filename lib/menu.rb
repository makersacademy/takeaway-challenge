class Menu
  attr_reader :list

  def initialize
    @list = {
            'Risotto'   => 5.5,
            'Carbonara' => 6.5,
            'Bolognese' => 6,
            'Calzone'   => 6,
            'Pizza'     => 7,
            'Coke'      => 2
            }
  end

  def show
    @list
  end

  def add(item, price)
    @list[item] = price
  end

  def remove(item)
    @list.delete(item)
  end

end
