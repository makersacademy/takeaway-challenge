require_relative 'menu'

class Takeaway
  attr_reader :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = Hash.new(0)
  end

  def show_menu
    @menu.show
  end

  def order(item, quantity = 1)
    raise "That dish is not on the menu" unless @menu.available?(item)

    @basket[item] += quantity
  end

  def checkout(total)
    raise "That is not the right price of the order, please try again" if total != sum

    time = Time.now.strftime("%H:%M")
    "Thank you! Your order was placed and will be delivered before #{time}"
  end

  private

  def sum
    @menu.sum(@basket)
  end

end
