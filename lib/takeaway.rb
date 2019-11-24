require_relative 'menu'
require_relative 'text'

class Takeaway

  def initialize(menu = Menu.new, text = Text.new)
    @menu = menu
    @text = text
    @basket = Hash.new(0)
  end

  def show_menu
    @menu.show
  end

  def order(item, quantity = 1)
    raise "That dish is not on the menu" unless @menu.available?(item)

    @basket[item] += quantity
    "#{quantity}x #{item} added to the basket"
  end

  def see_order
    return "Basket is empty" if @basket == {}
    order_list = []
    @basket.each { |item, quantity| order_list << "#{item} x#{quantity}" }
    message = ("Order is as follows:\n#{order_list.join("\n")}")
    puts message
  end

  def checkout(total)
    raise "That is not the right price of the order, please try again" if total != sum

    @text.send
    @basket = Hash.new(0)
    "Order successful, a confirmation text should be in it's way"
  end

  private

  def sum
    @menu.sum(@basket)
  end

end
