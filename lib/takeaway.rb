require_relative 'menu'

class Takeaway

  attr_reader :chosen_items, :menu, :final_bill

  def initialize(menu = Menu.new)
    @menu = menu
    @chosen_items = Hash.new(0)
    @final_bill = 0
  end

  def order_selection(item, quantity)
    fail 'item not on menu' unless menu.view_menu.include?(item)
    chosen_items[item] = quantity
  end

  def order_summary
    order_calc
  end

  def order_total
    "$#{order_total_calc}"
  end

  private

  def order_calc
    chosen_items.map do |item, quantity|
      "#{item} x #{quantity} = $#{menu.view_menu[item] * quantity}0"
    end.join(', ')
  end

  def order_total_calc
    chosen_items.each do |item, price|
      @final_bill += menu.view_menu[item] * price
    end
    "%.2f" % final_bill
  end

end
