class Restaurant

attr_reader :menu
attr_reader :dishes

  def initialize(menu)
    @menu = menu
  end

  def receive_order(dishes)
    @dishes = dishes
  end

end