class Takeaway

  def initialize(menu:)
    @menu = menu
  end

  def print_menu
    menu_list
  end

  private

  attr_reader :menu
end
