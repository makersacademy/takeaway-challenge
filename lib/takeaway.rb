class Takeaway

  def initialize
    @menu = Menu.new
    @selection = []
  end

  def select_item(item, quantity)
    @selection << {item => quantity}
  end

  def calculate_total
    @selection
  end

  def list_menu
    @menu.display_menu
  end
end
