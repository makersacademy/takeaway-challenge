#make a selection
require './lib/order'
require './lib/text'


class TakeAway
  attr_reader :my_order
  def initialize(order_klass = Order, text_klass = Text)
    @menu = {burger: 10,  salad: 5, drink: 2}
    @order = order_klass
    @text = text_klass
    @my_order = {}
  end

  def read_menu
    #refactor - take the p out
    @menu.each { |k,v| p " #{k} for #{v} pounds. "}
  end

  def add(dish, dish_portions = 1)
    dish = dish.to_sym
    dish_price = @menu[dish]
    @my_order[dish] = {portions: 0, price: dish_price } if not @my_order[dish]
    @my_order[dish][:portions] += dish_portions
    @my_order
    #bucket.add
  end

  def place_order
      new_order = @order.new(@my_order)
      new_order.confirm
      confirmation_text = @text.new.send

  end

end
