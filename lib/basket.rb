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
end