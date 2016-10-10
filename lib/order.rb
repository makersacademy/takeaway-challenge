require_relative 'menu'
require_relative 'checkout'

class Order

  attr_reader :menu, :basket, :confirm, :your_order

  def initialize(menu=Menu.new)
    @basket = Hash.new(0)
    @menu = menu
  end

  def select_item(item, quantity=1)
    basket[item] = quantity
    "#{quantity} x #{item} has been added to your basket"
  end

  def confirm
    "Your selection is: "
    basket.each do |item, quantity|
      @price = menu.item[item]
      "#{quantity} x #{item} = £#{@price} per dish"
    end
    your_order
  end

private

  def your_order
    basket.each do |item, quantity|
      @sum = 0
      price = menu.item[item]
      @sum += (price * quantity)
    end
    "Total cost: £#{@sum}"
  end

  # def your_order
  #   @basket.each { |quantity| @price * quantity }
  # end


  # cannot get this method to work in select_item
  # def added_to_basket
  #   if @basket.count == 1
  #     puts "#{quantity} x #{item} has been added to your basket"
  #   else
  #     puts "#{quantity} x #{item} have been added to your basket"
  #   end
  # end

end
