class Order

  DEFAULT_QUANTITY = 1
  attr_reader :basket, :item, :quantity

  def initialize
    @basket = Hash.new(0)
  end

  def add(item, quantity = DEFAULT_QUANTITY)
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
