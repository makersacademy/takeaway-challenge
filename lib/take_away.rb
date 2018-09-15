class TakeAway
  attr_reader :order_list, :menu
  def initialize(menu = Menu.new)
    @order_list = []
    @menu = menu
  end
end
