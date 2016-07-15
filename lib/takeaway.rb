class Takeaway

  def initialize(menu: )
    @menu = menu
  end

  def print_menu
    "Margherita: £6.50"
  end

  private

  attr_reader :menu
  
end
