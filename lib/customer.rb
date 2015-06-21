require_relative 'shop'

class Customer

  attr_reader :shop, :basket

  def initialize shop
    @shop = shop
    @basket = []
  end

  def ask_for_menu shop
    shop.show_menu
  end

  def select_dish dish #put dish with '', like 'lasagne'
    @basket << shop.show_menu[dish]
  end

  def ask_total
    total_to_pay = basket.inject{|sum,x| sum + x }
    total_to_pay
  end

  def pay total
    fail 'Sorry, you need to pay the exact total' if total != ask_total
    return 'Thanks for pay' if total == ask_total
    total
  end

end