class CurrentOrder

  def initialize
    @order = []
  end

  def add_item(item)
    @order << item
  end

  def total
    final_price = 0
    @order.each do |n| 
      final_price += n[:price]
    end
    show_order
    final_price
  end

  def clear_order
    @order = []
  end

  private

  def show_order
    puts @order
  end

end
