class Order

  attr_reader :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
  end

  def add(item)
    item = item.to_sym
    return "Sorry, #{item.downcase} is not on the menu" unless @menu.all_dishes.include?(item)
  end

  def remove
  end

  def order_summary
  end

  def checkout
  end


end
