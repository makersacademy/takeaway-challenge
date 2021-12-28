class Takeaway

  attr_reader :menu
  def initialize
    @menu = {Soup: 2, Bread: 1}
  end


  def display_menu
    @menu
  end

end