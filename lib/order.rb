require_relative './menu'

class Order
  attr_reader :current_order

  def initialize(menu: Menu)
    @menu = menu.new
    @current_order = []
    @total = 0
  end

  def check
    @total
  end

  def select(option, quantity = 1)
    @current_order << (item, value, sum = new_item(option, quantity))
  end

  private

  def new_item(option, quantity)
    if @menu.view[option.to_i].nil?
      "Entry not recognised"
    else
      @menu.view[option.to_i].each_pair do |item, value|
        @item = item
        @value = value
        @sum = value * quantity
        @total += @sum
      end
    end
    ["#{@item.capitalize}(#{quantity})","#{quantity} * #{@value}", @sum].flatten
  end

end

p a = Order.new
p a.select(1,2)
p a.select(1,2)
p a.current_order
p a.check