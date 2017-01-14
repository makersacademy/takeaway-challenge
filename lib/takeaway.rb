require_relative 'menu'

class Takeaway

attr_reader :order

  def initialize
     @menu = nil
     @bill = []
     @order = []
     @order_total = nil
  end

  def show_menu
    @menu = Menu.new.dishes
  end

  def place_order(selection, quantity)

    if @menu.has_key?(selection)
    @bill << [quantity * @menu[selection]]
    @order << {selection => quantity}
    end
  end

  def to_pay
    total
  end

private

attr_reader :total

  def total
    @order_total = @bill.inject(:+)
    @order_total.inject(:+)
  end
end
