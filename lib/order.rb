class Order

  attr_reader :order, :menu, :total

  def initialize(send_sms_class = Send_sms)
    @selection = {}
    @order = []
    @send_sms_class = send_sms_class
  end

  def show_order
    @order
  end

  def add(item, quantity)
    fail "Item doesn't exist" unless PrintedMenu::PRINTED_MENU.has_key?(item)
    @item = item
    @quantity = quantity
    @price = PrintedMenu::PRINTED_MENU[@item]

    @selection.store("Item", @item)
    @selection.store("Price", @price)
    @selection.store("Quantity", @quantity)
    @order << @selection
    @selection = {}
  end

  def place_order
    array_of_prices = @order.map { |h| (h ["Price"] * h ["Quantity"]) }
    @total = array_of_prices.sum
    send_sms = @send_sms_class.new
    send_sms.send_message
    "Here is your order #{@order}, the total is £#{@total}"
  end

  def total_check
    array_of_prices = @order.map { |h| (h ["Price"] * h ["Quantity"]) }
    @check_total = array_of_prices.sum
  end
end
