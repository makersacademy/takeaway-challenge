
class TakeAwayMenu
  def initialize

    @menu = { tuna: 4, frog: 1, lamb: 2, pork: 3 }
    @order = {}
    @total = 0
  end

  def menu
    @menu
  end

  def add_item_to_order(item = nil, quantity = 1)
    fail "Sorry #{item} is not available." if !@menu.include?(item.to_sym)
    fail "Please enter a positive quantity" if quantity < 1
    @order[item.to_sym] = [@menu[item.to_sym], quantity]
    @order
  end

  def check_order
    return "You have yet to place an order" if @order.empty?
    puts '---You have ordered---'
    @order.each do |key, value|
      puts key.to_s.ljust(10) + value[1].to_s + " €" + value[0].to_s
      @total += value[1] * value[0]
    end
    puts "--- Total = €#{@total} ---"
    return @order
  end


end
