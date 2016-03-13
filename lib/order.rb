
class Order

  attr_reader :menu

  def initialize(menuclass = Menu)
    @menu = menuclass.new
  end
end