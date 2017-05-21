
class Restaurant

  attr_reader :name, :address, :menu

  def initialize(name, address, menu = Menu.new, notifier = Notifier.new)
    @name = name
    @address = address
    @notifier = notifier
    @menu = menu
    @orders = []
  end
end
