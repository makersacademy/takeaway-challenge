class TakeAway

  attr_reader :menu, :courier

  def initialize(menu = Menu.new, courier = Courier.new)
    @menu = menu
    @courier = courier
  end

end
