class TakeAway

  attr_reader :menu, :courier

  def initialize(menu = Menu.new, messager = Messager.new)
    @menu = menu
    @courier = courier
  end

end
