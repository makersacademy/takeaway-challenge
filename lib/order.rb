class Order
  def initialize(order, menu)
    @order = order
    @menu = menu
  end

  def correct?
    process_order_string
    check_totals
  end

  private

  def process_order_string
    @order = @order
                 .split(',')
                 .collect! { |element| element.strip || element }
    @order_total = @order.delete_at(@order.length - 1).to_f
    @order = @order.each_slice(2).inject({}) { |memo,object| memo[object.first] = object.last.to_i; memo }
  end

  def check_totals
    menu_total = 0
    @order.each {|dish,quantity| menu_total += @menu[dish] * quantity}
    menu_total == @order_total
  end



end
