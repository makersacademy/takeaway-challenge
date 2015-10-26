class Order
  attr_reader :menu, :current_order, :invoice

  def initialize(menu,invoice_klass,twilio_klass)
    @menu = menu
    @current_order = []
    @invoice_klass = invoice_klass
    @twilio_klass = twilio_klass
  end

  def choose_item(dish,quantity=1)
    fail "Please specify at least a quantity of one" if quantity < 1
    quantity.times { current_order << menu.select_dish(dish) }
    current_order.flatten!
  end

  def order_total
    total = 0
    @current_order.each {|dish| total += dish.price}
    total
  end

  def confirm_order
    @invoice = @invoice_klass.new(current_order, @twilio_klass)
    @invoice.itemize_bill
  end

  def place_order(phone_num=ENV[PNUM])
    @invoice.place_order(phone_num)
  end

end