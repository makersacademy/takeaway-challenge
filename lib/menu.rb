
class Menu
  LIST_OF_DISHES = { 'formule1' => 10, 'formule2' => 15, 'formule3' => 20, 'drink' => 5 }
  attr_reader :order, :total

  def initialize
    @order = {}
    @total = 0
  end

  def print
    p LIST_OF_DISHES
  end

  def select(dishes = [], quants = [], total)
     @order = dishes.zip quants
     @total = total
  end

  def correct_total
    tot = 0
    @order.each { |dish, quant| tot += LIST_OF_DISHES[dish] * quant }
    tot
  end

  def checkout
     fail ('The sum is incorrect!') if @total != correct_total
     return 'Thank you! Your order was placed and will be delivered before 18:52'
  end

end
