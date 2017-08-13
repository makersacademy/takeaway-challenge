require_relative './menu.rb'

class User

  attr_accessor :basket, :menu, :price, :order_num, :total_amount
  DEAFAULT_QUANT = 1

  def initialize
    @menu = Menu.new.show_menu_hash
    @basket = []
    @price = []
    @order_num = 0
    @total_amount = 0
  end

  def order_selection(order_num, quantity = DEAFAULT_QUANT)
    order_error(order_num, quantity)
    keys = @menu.keys
    @price = @menu[keys[order_num.to_i - 1]]
    quantity.times do
      @basket << { order_num => @price }
    end
  end

  def total_price_of_basket
    total = []
    @basket.map do |basket_array|
     basket_array.each do |key, value|
      total << value
     end
    end
    @total_amount = total.reduce(:+)
  end

  def display_basket
    puts "The total value of your basket is £ #{@total_amount}"
  end

  def order_error(order_num, quantity)
    raise("Item does not exit") if order_num > 6
    raise("Item does not exit") if quantity < 1
  end

end

user = User.new
user.order_selection(2, 3)
user.total_price_of_basket
