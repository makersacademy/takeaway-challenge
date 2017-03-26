# build order
# read available options
# compare total
# submit order

require_relative 'menu'
require_relative 'order'

class TakeAway

  attr_reader :menu, :basket, :new_order, :item

def initialize(menu = Menu.new)
  @menu = menu
  @new_order = Order.new(menu)
  @basket = []
end

  def show_menu
    menu.dishes.each { |key, value| puts "#{key}.........£#{value}" }
  end

  def add(dish, quantity=1)
    self.new_order.add(dish, quantity)
    quantity.times { basket << new_order.add(dish) }
    "#{quantity}x #{dish} added to your basket"
  end

  def checkout(price)
    if price_match?(price)
      #{ send message }
      calculate_total
    else
      "Price doesn't match total"
    end
  end

  def calculate_total
    total = new_order.total_price(basket)
    puts "Total £#{total}"
    total
  end


  #send message to complete_order
  # def complete_order
  # end
  private

  attr_writer :item
  attr_writer :menu, :new_order

  def price_match?(price)
    price.to_f == self.new_order.total_price(basket)
  end

  # def confirm_order(my_selection, £total)
  #   order.amount_due?
  #   # by giving the list of dishes, their quantities
  #   # and a number that should be the exact total.
  #   price_match?
  # end



end


# Notes
# was in add
# self.item = {:dish => dish, :quantity => quantity }
# self.basket << [menu.dishes[dish]]
# self.total_price += self.menu.dishes[dish] * quantity
