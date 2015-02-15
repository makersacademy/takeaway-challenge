class Customer

  def initialize
    @mobile_no = "+447939172106"
    @order = {}
  end

  def mobile_no
    @mobile_no
  end

  def select_items(item)
    @order << item
  end

  def order
    @order
  end

  def set_quantity(item)
    quantity.gets.chomp
  end

  def place_order
  end


end
