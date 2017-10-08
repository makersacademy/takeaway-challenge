require_relative './menu'
class Takeaway
  attr_reader :order

  def initialize
    @order = {}
  end

  def add(item)
    item = item.to_sym
    calculate_dishes(item)
    item
  end

  def calculate_dishes(item)
     order[item] == nil ? order[item] = 1 : order[item] += 1
  end

  def view_basket
    @basket = {}
    calculate_total
    return @basket
  end


private

  def calculate_total
    @total_price = 0
    order.each do |item, quantity|
      str = item.to_s + '_x_' + quantity.to_s
      item_total_price = calculate_item_price(item, quantity)
      @basket[str.to_sym] = "£#{item_total_price}"
      @total_price += item_total_price
    end
    @basket[:total] = "£#{@total_price}"
  end

  def calculate_item_price(item, quantity)
    menu = Menu.new
    menu.price(item) * quantity
  end




end
