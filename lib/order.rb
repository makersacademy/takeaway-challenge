require_relative 'menu'

class Order

  attr_reader :menu, :basket, :your_order

  def initialize
    @basket = Hash.new(0)
    @menu = Menu.new
  end

  def select_item(item, quantity=1)
    basket[item] = quantity
  end

  def in_basket
    p basket[0]
  end

  def confirm
    basket.each do |item, quantity|
      price = menu.list[item]
      "Your selection is: #{item} x #{quantity} = #{price}"
    end
    your_order
  end

  def your_order
    basket.each do |item, quantity|
      @sum = 0
      price = menu.list[item]
      @sum += (price * quantity)
    end
    @sum
  end


end
