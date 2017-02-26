class Takeaway

attr_reader :menu

  def initialize(menu:)
    @menu = menu
  end

  def show_menu
    menu.to_string
  end

end
