class Takeaway

  def initialize(menu:)
    @menu = menu
  end

  def print_menu
    menu.print
  end

  private

  attr_reader :menu
  # Delegation used here to delegate menu function to menu object

end
