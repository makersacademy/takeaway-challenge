require_relative 'menu'

class Order

  attr_reader :menu, :basket, :confirm, :your_order

  def initialize(menu=Menu.new)
    @basket = Hash.new(0)
    @menu = menu
  end

  def select_item(item, quantity=1)
    basket[item] += quantity
    puts "#{quantity} x #{item} has been added to your basket"
  end

  def in_basket
    p basket[0]
  end

  def confirm
    basket.each do |item, quantity|
      price = menu.list[item]
      "Your selection is: #{item} x #{quantity} = #{price} per dish"
    end
    "Total cost: #{your_order}"
  end


  def your_order
    basket.each do |item, quantity|
      @sum = 0
      price = menu.list[item]
      @sum += (price * quantity)
    end
    @sum
  end

  # cannot get this method to work in select_item
  # def added_to_basket
  #   if @basket.count == 1
  #     puts "#{quantity} x #{item} has been added to your basket"
  #   else
  #     puts "#{quantity} x #{item} have been added to your basket"
  #   end
  # end

end
