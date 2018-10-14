class Order

  attr_reader :basket, :menu
  
  def initialize(menu)
    @menu = menu
    @basket = {}
    @total = 0
  end

  def select(item, quantity)
    raise "This item is not on the menu" unless menu.contains?(item)
    basket[item] = quantity
  end

  def remove(item)
    raise "Item not in basket" unless basket.has_key?(item)
    basket.delete(item)
  end

  def total
    calculate_basket
    "£#{@total}"
  end

private

<<<<<<< HEAD
  def calculate_basket
    basket.each do |item, quantity|
      @total += menu.price(item) * quantity
    end
  end
=======
def calculate_basket
  basket.each do |item, quantity|
    @total += menu.price(item) * quantity
  end
end
>>>>>>> d14941ceb290f225476639d0005181fbffee15f5

end
