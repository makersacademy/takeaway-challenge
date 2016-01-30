
class Order
  attr_reader :current_order

  def initialize(menu)
    @current_order = []
  end

def select_item(item)
  # fail if item !=
  @current_order << item
end

def complete_order

end
end
