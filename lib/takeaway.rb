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
    if @dishes.has_key?(food.to_sym)
    @basket[food] = amount
    else
      "Item not on menu, please try again"
    end
  end

  # def add
  # end

  def basket_summary
    @basket
  end

  # def total
  # end


end