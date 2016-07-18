class Basket

  attr_reader :basket, :subtotal
  def initialize
    @basket = []
  end

  def add(item, quantity, price)
    basket << [item, quantity, price]
  end

  def check_basket
    @subtotal = 0
    puts "Your basket contains:"
    basket.each do |item, quantity, price|
      puts "#{quantity} x #{item} = £#{(price * quantity.to_i)}"
      @subtotal += (price * quantity.to_i)
    end
    puts "Subtotal: £#{subtotal}"
    subtotal
  end
end
