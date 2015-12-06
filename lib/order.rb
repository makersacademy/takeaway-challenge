class Order

  attr_reader :current_order

  def initialize
    @current_order = {}
  end

  def take_order(dish, qty)
    first(dish) ? addmore(dish, qty) : addfirst(dish, qty)
  end

  private

    def first(dish)
      @current_order.has_key?(dish)
    end


    def addmore(dish,qty)
      @current_order[dish] += qty
    end

    def addfirst(dish, qty)
      @current_order[dish] = qty
    end


end
