class Takeaway

  def initialize
    @menu = Menu.new
  end

  def issue_menu
    @menu.print
  end

end
