class Takeaway

  def initialize(menu:)
    @menu = menu
  end

  def print_menu
    # the double in the test allows us to define print without creating it yet
    @menu.print
  end

  private

  attr_reader :menu
end
