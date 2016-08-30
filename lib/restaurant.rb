class Restaurant

  attr_reader :menu
  attr_reader :basket
  attr_reader :text_provider

  def initialize(menu=Menu.new, basket=Basket.new, text_provider=SMS.new)
    @menu = menu
    @basket = basket
    @text_provider = text_provider
  end

  def create_order(item,quantity,basket=Basket.new,order=Order.new(item,quantity,basket))
    @basket = order.create
  end

  def add_to_order(item,quantity,basket=@basket,order=Order.new(item,quantity,basket))
    @basket = order.add
  end

  def remove_from_order(item,quantity,basket=@basket,order=Order.new(item,quantity,basket))
    @basket = order.remove
  end

end
