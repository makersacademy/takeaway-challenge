require_relative 'menu'
class Order
  attr_reader :menu, :selection

  def initialize(menu = Menu.new)
    @menu = menu
    @selection = {}
  end 

  def see_menu
    @menu.read_menu
  end 

  def place_order(item, amount)
    raise "#{item} is not on the menu today" unless @menu.dish?(item)

    @selection[item.to_sym] = amount
    return "#{amount}x #{item}(s) added to basket = £#{@menu.price(item) * amount}"
  end 

  def total
    "Your order total is: £#{item_totals.inject(:+)}"
  end

  private 
  def item_totals
    @selection.map do |item, amount|
      @menu.price(item) * amount
    end 
  end 
end 
