class Takeaway
  attr_reader :menu
  
  def read_menu(menu = Menu)
    @menu = menu.new
    @menu.read
  end

end
