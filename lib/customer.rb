require_relative './menu'

class Customer

attr_reader :menu, :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
  end

  def read_menu
    menu.list
  end

  def order(item:, quantity:)
    quantity.times do | times |
      @basket << menu.list.select { |k,v| k == item }
    end
  end

end