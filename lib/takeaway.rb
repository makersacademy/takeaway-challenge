class Takeaway

  def initialize(menu:)
    #dont forget to initialize the other classes here
    @menu = menu
  end

  def print_menu
    menu.print
  end

private

attr_reader :menu
end
