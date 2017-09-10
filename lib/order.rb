require_relative 'menu'
require_relative 'text'

class Order

attr_reader :basket, :text, :menu

  def initialize (menu = Menu.new, text = Text.new)
    @menu = menu
    @text = text
    @basket = []
  end

  def choose_order(order)
    if order.downcase == "burger"
      @basket << @menu.item_list[1]
    elsif order.downcase == "pizza"
      @basket << @menu.item_list[0]
    elsif order.downcase == "kebab"
      @basket << @menu>item_list[2]
    else
      puts "That dish isn't on the menu"
    end
  end

  def confirm_order
   puts "Your order is as follows:"
   show_order
   puts "In total, your order will cost £#{price}."
  end

  def show_order
    @basket.each do |item|
      puts "#{item[:item]}"
    end
  end

private

  def price
    @basket.map {|item| item[:price]}.reduce(:+)
  end

end
