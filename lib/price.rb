class Price

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def item_price(item)
    return @menu.items.detect { |hash| hash[:dish] == item }[:price]
  end

end
