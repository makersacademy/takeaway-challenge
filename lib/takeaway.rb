class Takeaway

  attr_reader :menu, :order, :order_klass, :history, :text

  def initialize(menu, order_klass, text)
    @menu = menu
    @order_klass = order_klass
    @text = text
    @order = order_klass.new
    @history = []
  end

  def check_menu
    menu.dishes
  end

  def place_order(dish, qty=1)
    fail "Not on menu: #{dish}" if not_on_menu?(dish)
    order.take_order(dish, qty)
    order_summary
  end

  def check_order
    order_summary
  end

  def confirm_order
    calculate_bill
  end

  def complete_order
    history << order
    puts "Enter phone number for confirmation text"
    number = gets.chomp.to_i
    @text.send_text(number)
    new_order
  end

  private

  def not_on_menu?(dish)
    !menu.dishes.include?(dish)
  end

  def new_order
    @order = order_klass.new
  end

  def calculate_bill
    bill = 0
    @order.current_order.each{|k, v| bill += @menu.dishes[k] * v}
    print order_summary
    print "Final bill: £#{bill}"
  end

  def order_summary
    summary = ''
    @order.current_order.each do |k, v|
      cost = @menu.dishes[k] * v
      summary << "#{k} x #{v}: total £#{cost.round(2)}\n"
    end
    print summary
  end

end
