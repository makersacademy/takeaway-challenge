class Restaurant

  attr_reader :menu

  def initialize(name)
    @name = name
    @menu = Menu.new
  end
end
