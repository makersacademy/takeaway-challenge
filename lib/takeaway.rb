require_relative 'menu'

class Takeaway

  def initialize(menu_csv)
    @menu = Menu.new(menu_csv)
    @order =[]
  end

  def order(item, quantity = 1)
    @order << { item: item, quantity: quantity }
  end

  def show_order
    @order
  end

  def check_total(given_total)
    true if given_total == calculate_total
  end

private

  def calculate_total
   @total = 0
   @order.each { |element| @total += (@menu.price?(element[:item]) * element[:quantity]) }
   @total
  end
end
