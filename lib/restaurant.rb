class Restaurant

  attr_reader :menu, :takeaway

  def initialize(name, takeaway)
    @name = name
    @menu = Menu.new
    @takeaway = takeaway
  end
end
