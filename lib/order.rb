#Contains the details of the order and calculates the total price
class Order

  LINE_CENTER = 115

  def initialize
    @basket = []
  end

  def add(dish, price, amount)
    basket << {
      dish: dish,
      unit_price: price,
      amount: amount,
      selection_price: price*amount
    }
  end

  def confirm
    basket.each { |selection| puts ("#{selection[:amount]}x #{selection[:dish]}  £#{selection[:unit_price]}").center(LINE_CENTER)}
    puts ("----------------------------").center(LINE_CENTER)
    puts ("Total: £#{total}").center(LINE_CENTER)
  end

  def get_basket
    basket.dup
  end

  private

  attr_reader :basket

  def total
    basket.map { |selection| selection[:selection_price]}.inject(:+)
  end

end
