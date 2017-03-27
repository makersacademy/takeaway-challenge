class Takeaway

  attr_reader :menu

  def initialize
    @menu = Menu.new.dishes
  end

end
