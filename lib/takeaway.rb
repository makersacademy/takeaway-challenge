require_relative 'menu'

class Takeaway

attr_reader :order, :price, :current_order

  def initialize
     @menu = nil
     @price = []
     @current_order = []

  end

  def show_menu
    @menu = Menu.new.dishes
  end

  def place_order(selection, quantity)

    if @menu.has_key?(selection)
    @price << [quantity * @menu[selection].to_f]
    running_total = quantity * @menu[selection]
    @current_order << {:Selection => selection, :Quantity => quantity, :Total => running_total}
    end
  end

  def basket



  end

  def to_pay
    total
  end

private

attr_reader :total

  def total
    @order_total = @price.inject(:+)
    @order_total.inject(:+)
  end
end
