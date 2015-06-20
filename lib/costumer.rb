class Costumer

  attr_reader :basket

  def initialize (menu)
    @basket = {}
    @menu = menu
    @sum = 0
  end

  def add(item, count = 1)
    basket[item] = count * menu.show[item]
    basket
  end

  def total
    basket.each_value{|price| @sum += price}
    @sum
  end

  def pay amount
    fail 'Incorrect amount' unless amount == total
  end

  private
  attr_reader :menu

end
