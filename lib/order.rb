
class Order
  attr_reader :current_order

  def initialize(menu)
    @current_order = []
  end

  def select_item(item)
    if item == 'chips' or item == 'sausage' or item =='fish'
      @current_order << item
    else
      raise 'please select item from menu'
    end
  end

  def complete_order

  end
end
