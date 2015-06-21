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

end