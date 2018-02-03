class Order
  attr_reader :basket

  def initialize
    @basket = Hash.new(0)
  end

  def add(item, quantity = 1)
    @item, @quantity = item, quantity
    @quantity.times do
      @basket[item] += 1
    end
    puts "#{@quantity} x #{@item} added to basket"
  end

  def remove
    # remove meal from basket
  end

  def current_total
    # returns total from basket
  end

end
