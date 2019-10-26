class Takeaway

def initialize(menu:)
  @menu = menu
end

  def list_menu
    menu.list
  end

  private
  attr_reader :menu
end
