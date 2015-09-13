class Menu

  attr_reader :list

  def initialize
    @list = {'fish':[5.0, 0],
             'cake':[2.99, 0],
             'beef':[7.0, 0]}
  end

  def select_food(item)
    @list.select { |key| key == item.to_sym }
  end

end
