class Takeaway

  def initialize
    # Not enforced, but menu hash structure is {"dish name" => cost}
    @menu=Hash.new
  end

  def add_menu_items(items)
    @menu.merge!(items)
  end

  def list_menu
    @menu
  end

end
