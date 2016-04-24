require_relative './menu'

class Customer

attr_reader :menu, :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @running_total = 0
  end

  def read_menu
    menu.list
  end

  def order(item:, quantity:)
    quantity.times do | times |
      @basket << menu.list.select { |k,v| k == item }
    end
  end

  def checkout(expected_total)
    @basket.each do |item|
      @running_total += @menu.list[item.keys[0]]
    end
    if @running_total != expected_total
      raise "Your expected total amount due is not correct. Please try to checkout again"
    else
      print "Order complete, thanks!"
    end
  end

end