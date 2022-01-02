require_relative 'menu'

class Takeaway
  attr_reader :basket, :sub_total

  def initialize(menu = Menu.new)
    @menu = menu.dish
    @basket = {}
    @sub_total = 0
  end 

  def show_menu
    @menu
  end 

  def add_item(item, quantity)
    raise 'Item not on menu. Please pick something else' if item_not_on_menu?(item)
    @basket[item] = quantity
  end 

  def total_bill
    @basket.each do |item, quantity|
      @sub_total += (@menu[item] * quantity)
    end
    @sub_total
  end
  
  private

  def item_not_on_menu?(item)
    @menu[item].nil?
  end
end 
