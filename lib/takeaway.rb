class Takeaway
  def initialize(menu)
    @menu = menu
  end

  def see_menu
    menu
  end

  private

  attr_reader :menu
end