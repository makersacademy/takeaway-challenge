class Takeaway

  def initialize(menu:)
    @menu = menu
  end

  def show_menu
    menu.show
  end

  private

  attr_reader :menu

end
