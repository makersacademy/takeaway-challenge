class Order
  attr_reader :order_made

  def initialize
    @order_made = []
  end

  def add(item, number)
    menu_object = Menu.new
    if !menu_object.has_item?(item)
      puts "Sorry this item is not present in the menu :("
      @order_made
    else
      @order_made << [item, number]
      added_item_display(item, number)
    end
  end

  def added_item_display(item, number)
    puts "#{number} #{item} have been added to your order"
  end

  private :added_item_display

end
