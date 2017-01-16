class Takeaway
  def initialize(menu:)
    @menu = menu
  end

  def print_menu
    menu.print
  end

  private

  attr_reader :menu
end

#delegation is simply one object calling another object and saying "you handle this"
