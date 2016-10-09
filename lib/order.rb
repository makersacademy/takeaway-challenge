require_relative 'menu'
require_relative 'checkout'

class Order

  attr_reader :menu, :basket, :confirm, :your_order

  def initialize(menu=Menu.new)
    @basket = Hash.new(0)
    @menu = menu
  end

  def select_item(item, quantity=1)
    basket[item.to_sym] = quantity
    puts "#{quantity} x #{item} has been added to your basket"
  end

  def in_basket
    p basket[0]
  end

  def confirm
    puts "Your selection is: "
    basket.each do |item, quantity|
      price = menu.item[item]
      puts "#{quantity} x #{item} = £#{price} per dish"
    end
    puts "Total cost: £#{your_order}"
  end


  def your_order
    basket.each do |item, quantity|
      @sum = 0
      price = menu.item[item]
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
