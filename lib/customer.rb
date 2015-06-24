require_relative 'shop'
require_relative 'textsender'

class Customer

  attr_reader :shop, :basket

  def initialize shop, textsender
    @shop = shop
    @basket = []
    @textsender = textsender
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
    if total == ask_total
      'Thanks for pay'
      @textsender.submit_text #why not working?
      total
    end
  end

end