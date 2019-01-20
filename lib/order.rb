require_relative 'menu'

class Order

  attr_accessor :basket, :total_order

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @order_amount = []

  end

  def add_to_order(choice)
    tally_order
    @basket << choice
    print "Added #{choice} to your order."
  end

  def tally_order
    @basket.each do |order_item|
      @menu.menu_hash.each do |dish, price|
        @order_amount << price.to_i if order_item == dish
        end
        return @order_amount
    end
  end

end
