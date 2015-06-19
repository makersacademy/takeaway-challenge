class Takeaway

  attr_reader :menu

  def initialize
    @menu = 'pizza: 8'
  end

  def show_menu
    (@menu)
  end

end