# Stores menu selections
class Basket
  attr_reader :contents, :total

  def initialize
    @contents = []
    @total = 0
  end

  def add(menu)
    menu.selection.each { |dish|
      @contents << dish
      @total += dish[:price]
    }
  end

  def itemise
    @contents.each { |dish|
    puts "#{@contents.count(dish)} x #{dish.name} @ £#{'%.2f' % (dish.cost / 100.00)} each"
    }
  end
end