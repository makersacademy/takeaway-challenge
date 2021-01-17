require_relative 'menu'

class Takeaway
attr_reader :dishes, :basket

  def initialize
    @dishes = Menu.new.dishes
    @basket = {}
  end

  def read_menu
    @dishes
  end

  def order(food, amount = 1)
    @basket[food] = amount
  end

  # def add
  # end

  def basket_summary
    @basket
  end

  # def total
  # end


end