require_relative 'menu'

class Order

  attr_reader :basket, :menu

  def initialize(menu = Menu.new)
    @basket = Hash.new(0)
    @menu = menu
  end

  def add_item(item, quantity = 1)
    check_item_exits(item)
    @basket[item] = @basket[item] + quantity
    add_basket_confirmation(item, quantity)
  end

  def total_order    
    total = []
    @basket.each do |item, quantity|
      total.push(@menu.items[item] * quantity) 
    end
    "£#{total.sum}"
  end

  def basket_summary
    summary = []
    @basket.each do |item, quantity|
      summary.push("#{item} x £#{quantity} = £#{@menu.items[item] * quantity}")
    end
    summary.join(", ")
  end

  private
  def check_item_exits(item)
    fail "Item not in menu" if @menu.items[item].nil?
  end

  def add_basket_confirmation(item, quantity)
    "You have added #{quantity} #{item}#{quantity > 1 ? "s" : nil} into your basket"
  end
end 
