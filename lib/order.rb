require_relative 'menu'

class Order
  DEFAULT_QUANTITY = 1
  attr_reader :basket, :item, :quantity

  def initialize
    @basket = Hash.new(0)
  end

  def add(item, quantity = DEFAULT_QUANTITY)
    # raise error if item is not on menu
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
    total = 0
    @basket.each do |item, quantity|
      total += (quantity * @menu.price)
    end
    total
  end

  def checkout
    # sends text confirmation to user
  end

end
