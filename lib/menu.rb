class Menu

  def initialize
    @list = {
            'Carbonara' => 6.5,
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

  private

  attr_reader :list

end
