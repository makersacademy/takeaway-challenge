# Stores menu selections
# Returns an itemised view of contents
class Basket
  attr_reader :contents, :total

  def initialize
    @contents = []
    @total = 0
  end

  def add(menu)
    menu.selection.each { |dish|
      @contents << dish
      @total += dish.price
    }
  end

  def itemise
    unique_dishes = @contents.uniq
    unique_dishes.each { |dish|
    puts "#{@contents.count(dish)} x #{dish.name} @ £#{'%.2f' % (dish.price / 100.00)} each"
    }
  end
end