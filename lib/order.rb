class Order

  attr_reader :selection, :estimated_total

  def initialize
  end

  def select_menu_items(selection, estimated_total)
    @estimated_total = estimated_total
    @selection = selection
  end

end
