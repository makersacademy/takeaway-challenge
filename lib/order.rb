class Order

  attr_reader :ordered_items, :menu

  def initialize(menu_class = Menu)
    @menu = menu_class.new
    @ordered_items = []
  end

  # adds an item to order
  def add_item(chosen_dish)
    # raise "The item is not on the menu." if !@menu.menu.has_value(chosen_dish)  
    @menu.menu.each do |dish|
      dish[:name] == chosen_dish ? @ordered_items << dish : nil
    end
    # @ordered_items
  end
  
  # ends order, generates receipts and sends text to user
  def end_order(receipt_class = ReceiptCalc)
    raise "You haven't yet added any items." if @ordered_items.empty? == true
    @receipt = receipt_class.new(@ordered_items)
    @receipt.generate_receipt
  end

end
