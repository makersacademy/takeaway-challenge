require './lib/menu'

class Order

  attr_reader :basket, :total, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = {}
    @total = 0
    @count = 0
  end

  def add(dish, quantity)
    @basket[dish] = quantity
    #@basket.store(dish, quantity)
  end

  # def item_count
  #   #@count += @count + quantity
  #   @current_total = @count *= quantity
  #   @basket[@current_total] = @count
  # end

  def view_basket
    @basket
  end

  def view_total

  end

end
