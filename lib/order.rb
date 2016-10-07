require_relative 'menu'

class Order

  attr_reader :menu, :put_in_basket

  def initialize
    @put_in_basket = []
    @menu = Menu.new
  end

  def select_item(item)
    @put_in_basket << item
  end

end
