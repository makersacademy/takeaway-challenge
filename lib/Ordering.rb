class Ordering
  
  def initialize (menu = nil, cart = nil, kitchen = nil)
    @menu = menu
    @cart = cart
    @kitchen = kitchen
  end

  def menu
    @menu.print
  end

  def view_cart
    @cart.show_cart
  end

  def add_to_order item_name
    item = @menu.available?(item_name)
    raise "#{item_name} not available" if item == false
    @cart.add_to_order(item)
  end

  def checkout
    invoice = @cart.invoice()
    order = invoice_to_order_form(invoice)
    order_success = @kitchen.order(order)
    invoice
    # send confirmation text to customer
  end

  private

  def invoice_to_order_form invoice
    puts invoice.reject{|k| k == :Total}
    invoice.reject{|k| k == :Total}.map{ |k, v| [k, v[:number]] }.to_h
  end
end