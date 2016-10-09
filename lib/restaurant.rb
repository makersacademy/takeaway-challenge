class Restaurant
  def initialize
    @menu = Menu.new
  end

  attr_reader :menu
  # def menu
  #   @menu.view
  # end

end
