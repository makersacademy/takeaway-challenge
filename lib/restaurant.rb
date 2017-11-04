class Restaurant
  attr_reader :menu, :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
  end

  def steakhouse
    @menu.steakhouse
  end

  def order(item)
    @basket << @menu.steakhouse.select { |k| k[:name].include?(item) }
  end



end
