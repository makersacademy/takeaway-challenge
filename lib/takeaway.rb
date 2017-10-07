class Takeaway

attr_reader :menu

  def initialize
    @menu = {"Spring Rolls" => 4}
  end

  def view_menu
    menu
  end

end
