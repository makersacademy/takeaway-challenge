class TakeAway

  attr_reader :basket,
              :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = {}
  end
end
