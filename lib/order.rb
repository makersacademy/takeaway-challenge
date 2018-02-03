require_relative 'menu'

class Order

attr_reader :basket, :menu

  def initialize
    @basket = {}
  end

  def add(dish, quantity)
    @menu = Menu.new
    dish_in_menu?(dish)
    @basket[dish] = quantity
    "#{dish} x#{quantity} added to your basket"
  end

  def sub_total
    @basket.map do |dish, quantity|
      "#{dish} x#{quantity} = £#{(quantity * (@menu.dishes[dish]))}"
    end.join(", ")
  end


private

def dish_in_menu?(dish)
fail "This dish is not on the menu" unless @menu.dishes.has_key?(dish)
end



end
