class Basket
  attr_reader :current_order

  def initialize
    @menu = Menu.new
    @current_order = []
    @total = 0
  end

  def add(item_number)
    @current_order << @menu.dishes.at(item_number - 1) if item_number <= @menu.dishes.length
  end

  def total
    @current_order.each do |dish|
      @total += dish.fetch(:price).to_f
    end
    @total
  end
end
